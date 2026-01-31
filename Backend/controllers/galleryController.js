import pool from "../db.js";
import multer from "multer";
import { v2 as cloudinary } from 'cloudinary';

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});
// FIX: Use memoryStorage. Vercel blocks diskStorage and fs.existsSync on local folders.
const storage = multer.memoryStorage();

export const uploadGallery = multer({ storage });
export const addImage = async (req, res) => {
    const files = req.files; // Multer handles multiple files here
    const { title, album_name } = req.body;

    if (!files || files.length === 0) return res.status(400).json({ message: "No photos selected." });

    try {
        const uploadPromises = files.map(file => {
            return new Promise((resolve, reject) => {
                const stream = cloudinary.uploader.upload_stream(
                    { folder: "college_gallery" },
                    (error, result) => {
                        if (error) reject(error);
                        else resolve(result.secure_url);
                    }
                );
                stream.end(file.buffer);
            });
        });

        const urls = await Promise.all(uploadPromises);

        const dbQueries = urls.map(url => {
            return pool.query("INSERT INTO image (image, title, album_name) VALUES (?, ?, ?)", 
            [url, title || null, album_name || 'General']);
        });

        await Promise.all(dbQueries);
        res.status(201).json({ message: "Photos uploaded to Cloudinary successfully!" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Database/Cloudinary error" });
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
