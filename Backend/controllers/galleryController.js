import { v2 as cloudinary } from 'cloudinary';
import multer from "multer"; // <--- ADD THIS LINE
import pool from "../db.js"; // Ensure this path is correct

// Force Vercel to use the system environment variables directly
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
  secure: true // Add this for Vercel's https environment
});

// Use memory storage for Vercel compatibility
const storage = multer.memoryStorage();
export const uploadGallery = multer({ storage }); // Export this to use in Routes

export const addImage = async (req, res) => {

  console.log("Cloudinary Config Check:", {
        name: process.env.CLOUDINARY_CLOUD_NAME,
        key: !!process.env.CLOUDINARY_API_KEY,
        secret: !!process.env.CLOUDINARY_API_SECRET
    });
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
        // 1. Get the Image URL from the database first
        const [rows] = await pool.query("SELECT image FROM image WHERE image_id = ?", [id]);
        
        if (rows.length === 0) {
            return res.status(404).json({ message: "Photo not found in database." });
        }

        const imageUrl = rows[0].image;

        // 2. Extract the "Public ID" from the Cloudinary URL
        // Example URL: https://res.cloudinary.com/dt9pcdthz/image/upload/v12345/college_gallery/photo1.jpg
        // We need: "college_gallery/photo1"
        const urlParts = imageUrl.split('/');
        const fileNameWithExtension = urlParts[urlParts.length - 1]; // "photo1.jpg"
        const fileName = fileNameWithExtension.split('.')[0]; // "photo1"
        
        // If you used a folder in your upload_stream, include it here:
        const publicId = `college_gallery/${fileName}`;

        // 3. Delete from Cloudinary
        await cloudinary.uploader.destroy(publicId);

        // 4. Finally, delete from Aiven MySQL
        const [result] = await pool.query("DELETE FROM image WHERE image_id = ?", [id]);

        res.json({ message: "Photo deleted from Cloudinary and Database successfully!" });

    } catch (err) {
        console.error("Delete Error:", err);
        res.status(500).json({ message: "Server Error: " + err.message });
    }
};
