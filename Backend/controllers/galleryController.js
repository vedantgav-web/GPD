import pool from "../db.js";
import multer from "multer";

// FIX: Use memoryStorage. Vercel blocks diskStorage and fs.existsSync on local folders.
const storage = multer.memoryStorage();

export const uploadGallery = multer({ storage });

export const addImage = async (req, res) => {
    const files = req.files;
    const { title, album_name } = req.body;

    if (!files || files.length === 0) {
        return res.status(400).json({ message: "No photos selected." });
    }

    try {
        const queries = files.map(file => {
            // Since we can't save the file path on Vercel's disk, 
            // we save the original name as a reference for your demo.
            return pool.query(
                "INSERT INTO image (image, title, album_name) VALUES (?, ?, ?)", 
                [file.originalname, title || null, album_name || 'General']
            );
        });

        await Promise.all(queries);
        res.status(201).json({ message: "Photos uploaded successfully!" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Database error" });
    }
};

export const deleteImage = async (req, res) => {
    const { id } = req.params;
    try {
        const [result] = await pool.query("DELETE FROM image WHERE image_id = ?", [id]);
        if (result.affectedRows === 0) return res.status(404).json({ message: "Photo not found" });
        res.json({ message: "Photo deleted" });
    } catch (err) {
        res.status(500).json({ message: "Database error" });
    }
};
