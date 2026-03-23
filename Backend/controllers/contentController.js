import pool from "../db.js";
import multer from "multer";
import { v2 as cloudinary } from 'cloudinary';

// 1. Cloudinary Configuration (Trimmed for safety)
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME?.trim(),
  api_key: process.env.CLOUDINARY_API_KEY?.trim(),
  api_secret: process.env.CLOUDINARY_API_SECRET?.trim(),
  secure: true
});

const storage = multer.memoryStorage();
export const upload = multer({ storage: storage });

// --- 1. ADD ANNOUNCEMENT ---
export const addAnnouncement = async (req, res) => {
    const { title, short_description, long_description } = req.body;
    const files = req.files; 

    try {
        let attachmentUrl = null;

        if (files && files.length > 0) {
            const file = files[0]; 
            
            const uploadResult = await new Promise((resolve, reject) => {
                const stream = cloudinary.uploader.upload_stream(
                    { 
                        folder: "announcements",
                        resource_type: "auto" // Supports PDF, Images, DOCX
                    },
                    (error, result) => {
                        if (error) reject(error);
                        else resolve(result);
                    }
                );
                stream.end(file.buffer);
            });
            attachmentUrl = uploadResult.secure_url;
        }

        await pool.query(
            "INSERT INTO announcements (title, short_description, long_description, attachments) VALUES (?, ?, ?, ?)",
            [title, short_description, long_description, attachmentUrl]
        );

        res.status(201).json({ success: true, message: "Announcement published successfully!" });
    } catch (err) {
        console.error("Upload/DB Error:", err);
        res.status(500).json({ success: false, message: "Error saving announcement: " + err.message });
    }
};

// --- 2. DELETE ANNOUNCEMENT (WITH CLOUDINARY CLEANUP) ---
export const deleteAnnouncement = async (req, res) => {
    const { id } = req.params;
    try {
        // 1. Fetch the attachment URL before deleting the record
        const [rows] = await pool.query("SELECT attachments FROM announcements WHERE announcement_id = ?", [id]);
        
        if (rows.length === 0) {
            return res.status(404).json({ message: "Announcement not found" });
        }

        const fileUrl = rows[0].attachments;

        // 2. If an attachment exists, delete it from Cloudinary
        if (fileUrl && fileUrl !== 'None' && fileUrl !== '') {
            try {
                // Extract Public ID
                // Format: .../upload/v123/announcements/filename.pdf
                const urlParts = fileUrl.split('/');
                const fileNameWithExt = urlParts[urlParts.length - 1]; // "filename.pdf"
                const publicId = `announcements/${fileNameWithExt.split('.')[0]}`;

                // Determine resource type (PDFs are 'raw' or 'image' depending on Cloudinary settings, 'auto' handles it)
                await cloudinary.uploader.destroy(publicId, { 
                    resource_type: fileUrl.toLowerCase().endsWith('.pdf') ? 'image' : 'image' 
                });
                // Note: If Cloudinary stores your PDFs as 'raw', you'd use resource_type: 'raw'
            } catch (cloudErr) {
                console.error("Cloudinary Cleanup Warning:", cloudErr.message);
                // We continue so the DB record still gets deleted even if Cloudinary fails
            }
        }

        // 3. Delete from Database
        await pool.query("DELETE FROM announcements WHERE announcement_id = ?", [id]);
        
        res.json({ success: true, message: "Announcement and attachment deleted successfully" });
    } catch (err) {
        console.error("Delete Error:", err);
        res.status(500).json({ message: "Database error" });
    }
};

// --- 3. ADD & DELETE LINK (Stay the same as they don't use Cloudinary) ---
export const addLink = async (req, res) => {
    const { name, link } = req.body;
    try {
        await pool.query("INSERT INTO links (name, link) VALUES (?, ?)", [name, link]);
        res.status(201).json({ success: true, message: "Link added successfully!" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};

export const deleteLink = async (req, res) => {
    const { id } = req.params;
    try {
        const [result] = await pool.query("DELETE FROM links WHERE link_id = ?", [id]);
        if (result.affectedRows === 0) return res.status(404).json({ message: "Link not found" });
        res.json({ success: true, message: "Link deleted successfully" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};
