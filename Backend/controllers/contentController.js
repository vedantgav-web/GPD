import pool from "../db.js";
import multer from "multer";
import { v2 as cloudinary } from 'cloudinary';

// 1. Cloudinary Configuration
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});

// 2. Multer Configuration (Using Memory Storage for Vercel)
const storage = multer.memoryStorage();
export const upload = multer({ storage: storage });

// --- 1. ADD ANNOUNCEMENT ---
export const addAnnouncement = async (req, res) => {
    const { title, short_description, long_description } = req.body;
    
    // Check if files were uploaded (Multer puts them in req.files)
    const files = req.files; 

    try {
        let attachmentUrl = null;

        if (files && files.length > 0) {
            const file = files[0]; // Take the first file
            
            // Upload to Cloudinary using a Buffer Stream
            const uploadResult = await new Promise((resolve, reject) => {
                const stream = cloudinary.uploader.upload_stream(
                    { 
                        folder: "announcements",
                        resource_type: "auto" // Essential for PDF/DOCX support
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

        // Save to Aiven MySQL
        await pool.query(
            "INSERT INTO announcements (title, short_description, long_description, attachments) VALUES (?, ?, ?, ?)",
            [title, short_description, long_description, attachmentUrl]
        );

        res.status(201).json({ success: true, message: "Announcement published successfully!" });
    } catch (err) {
        console.error("Upload/DB Error:", err);
        res.status(500).json({ success: false, message: "Error saving announcement" });
    }
};

// --- 2. DELETE ANNOUNCEMENT ---
export const deleteAnnouncement = async (req, res) => {
    const { id } = req.params;
    try {
        const [result] = await pool.query("DELETE FROM announcements WHERE announcement_id = ?", [id]);
        if (result.affectedRows === 0) return res.status(404).json({ message: "Announcement not found" });
        res.json({ success: true, message: "Announcement deleted successfully" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};

// --- 3. ADD LINK ---
export const addLink = async (req, res) => {
    const { name, link } = req.body;
    try {
        await pool.query("INSERT INTO links (name, link) VALUES (?, ?)", [name, link]);
        res.status(201).json({ success: true, message: "Link added successfully!" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};

// --- 4. DELETE LINK ---
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
