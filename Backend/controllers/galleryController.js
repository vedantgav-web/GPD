import pool from "../db.js";
import multer from "multer";
import path from "path";
import fs from "fs"; // Import the File System module

// 1. Configure Storage with a "Duplicate Check"
const storage = multer.diskStorage({
    destination: "./uploads/gallery/",
    filename: (req, file, cb) => {
        const fullPath = path.join("./uploads/gallery/", file.originalname);

        // Check if the file physically exists on the server
        if (fs.existsSync(fullPath)) {
            // Passing an error to the callback stops the upload
            return cb(new Error(`File already exists: ${file.originalname}`));
        }

        // If it doesn't exist, use the original name
        cb(null, file.originalname);
    }
});

// 2. Initialize Multer
export const uploadGallery = multer({ storage });

// 3. Add Images Logic
export const addImage = async (req, res) => {
    const files = req.files;
    const { title, album_name } = req.body;

    if (!files || files.length === 0) {
        return res.status(400).json({ message: "No photos selected or files already exist." });
    }

    try {
        const queries = files.map(file => {
            return pool.query("INSERT INTO image (image, title,album_name) VALUES (?,?, ?)", [file.path, title || null, album_name || 'General']);
        });

        await Promise.all(queries);
        res.status(201).json({ message: "Photos uploaded successfully!" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Database error" });
    }
};
// ... (Keep deleteImage as it is)

// 3. Delete Image
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