import pool from "../db.js";
import multer from "multer";
import { v2 as cloudinary } from 'cloudinary';

// 1. Cloudinary Configuration
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});
export const upload = multer({ storage });

export const addAnnouncement = async (req, res) => {
    const { title, short_description, long_description } = req.body;
    
    // Check if a file was uploaded (Multer puts it in req.files)
    const file = req.files && req.files.length > 0 ? req.files[0] : null;

    try {
        let attachmentUrl = null;

        if (file) {
            // 3. Upload to Cloudinary using a Buffer Stream
            const uploadResult = await new Promise((resolve, reject) => {
                const stream = cloudinary.uploader.upload_stream(
                    { 
                        folder: "announcements",
                        resource_type: "auto" // CRITICAL: This allows PDF, Image, and DOCX
                    },
                    (error, result) => {
                        if (error) reject(error);
                        else resolve(result);
                    }
                );
                stream.end(file.buffer);
            });
            attachmentUrl = uploadResult.secure_url; // This is the full Cloud Link
        }

        // 4. Save the full URL to Aiven MySQL
        await pool.query(
            "INSERT INTO announcements (title, short_description, long_description, attachments) VALUES (?, ?, ?, ?)",
            [title, short_description, long_description, attachmentUrl]
        );

        res.status(201).json({ message: "Announcement published successfully!" });
    } catch (err) {
        console.error("Upload/DB Error:", err);
        res.status(500).json({ message: "Error saving announcement" });
    }
};



export const deleteAnnouncement = async (req, res) => {
    const { id } = req.params;
    try {
        const [result] = await pool.query("DELETE FROM announcements WHERE announcement_id = ?", [id]);
        if (result.affectedRows === 0) return res.status(404).json({ message: "Announcement not found" });
        res.json({ message: "Announcement deleted successfully" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};

// --- Links ---
export const addLink = async (req, res) => {
    const { name, link } = req.body;
    try {
        await pool.query("INSERT INTO links (name, link) VALUES (?, ?)", [name, link]);
        res.status(201).json({ message: "Link added successfully!" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};

export const deleteLink = async (req, res) => {
    const { id } = req.params; // Using ID is safer than name
    try {
        const [result] = await pool.query("DELETE FROM links WHERE link_id = ?", [id]);
        if (result.affectedRows === 0) return res.status(404).json({ message: "Link not found" });
        res.json({ message: "Link deleted successfully" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};
