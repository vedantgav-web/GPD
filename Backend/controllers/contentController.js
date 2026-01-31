import pool from "../db.js";
import multer from "multer";
import path from "path";

const storage = multer.memoryStorage(); 

export const upload = multer({ storage });

export const addAnnouncement = async (req, res) => {
    const { title, short_description, long_description } = req.body;
    
    // Since we use memoryStorage, req.files[0] contains a 'buffer' instead of a 'path'
    // For your college demo, we can store a placeholder or skip the path if not using a cloud bucket
    const attachmentName = req.files && req.files.length > 0 ? req.files[0].originalname : null;

    try {
        await pool.query(
            "INSERT INTO announcements (title, short_description, long_description, attachments) VALUES (?, ?, ?, ?)",
            [title, short_description, long_description, attachmentName]
        );
        res.status(201).json({ message: "Announcement published!" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Error saving to database" });
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
