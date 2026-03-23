import express from "express";
import { addImage, deleteImage, uploadGallery } from "../controllers/galleryController.js";

const router = express.Router();

// Use .array('photos') directly as middleware
// 'photos' must match the name used in formData.append("photos", ...)
router.post("/add", uploadGallery.array('photos'), addImage);

router.delete("/delete/:id", deleteImage);

export default router;
