import multer from "multer";

import express from "express";
import { addImage, deleteImage, uploadGallery } from "../controllers/galleryController.js";

const router = express.Router();

router.post("/add", (req, res) => {
    const upload = uploadGallery.array('photos');

    upload(req, res, (err) => {
        if (err instanceof multer.MulterError) {
            // A Multer error occurred when uploading (e.g., file too large)
            return res.status(400).json({ message: "Multer error: " + err.message });
        } else if (err) {
            // This catches our "File already exists" error from the controller storage
            return res.status(400).json({ message: err.message });
        }

        // Everything went fine, move to the controller to save to Database
        addImage(req, res);
    });
});

// Use DELETE for deleting by ID
router.delete("/delete/:id", deleteImage);

export default router;