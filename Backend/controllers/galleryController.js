import pool from "../db.js";
import { v2 as cloudinary } from 'cloudinary';
import multer from "multer";

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
  secure: true
});

// Use memory storage for Vercel compatibility
const storage = multer.memoryStorage();
export const uploadGallery = multer({ storage }); // Export this to use in Routes

export const addImage = async (req, res) => {

  if (!cloudinary.config().api_key) {
        return res.status(500).json({ message: "Cloudinary config missing on server" });
    }
    const files = req.files; 
    const { title, album_name } = req.body;

    if (!files || files.length === 0) {
        return res.status(400).json({ message: "No photos selected." });
    }

    try {
        // 1. Upload all files to Cloudinary
       const uploadPromises = files.map(file => {
    return new Promise((resolve, reject) => {
        const stream = cloudinary.uploader.upload_stream(
            { 
                folder: "college_gallery",
                // Remove use_filename and unique_filename for now to fix the signature
                // Cloudinary will use its default preset settings
            },
            (error, result) => {
                if (error) {
                    console.error("Cloudinary Stream Error:", error);
                    reject(error);
                } else {
                    resolve(result.secure_url);
                }
            }
        );
        stream.end(file.buffer);
    });
});

        const urls = await Promise.all(uploadPromises);

        // 2. Insert into Database
        const dbPromises = urls.map(url => {
            return pool.query(
                "INSERT INTO image (image, title, album_name) VALUES (?, ?, ?)", 
                [url, title || null, album_name || 'General']
            );
        });

        await Promise.all(dbPromises);
        res.status(201).json({ message: "Photos uploaded successfully!" });

    } catch (err) {
        console.error("Cloudinary/DB Error:", err);
        res.status(500).json({ message: "Server Error: " + err.message });
    }
};

// ... keep your deleteImage function the same ...
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
