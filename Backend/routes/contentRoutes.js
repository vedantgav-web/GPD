import express from "express";
import { 
    addAnnouncement, 
    deleteAnnouncement, 
    addLink, 
    deleteLink, 
    upload 
} from "../controllers/contentController.js";

const router = express.Router();

// --- Announcements ---
// Use upload.array('attachments') to handle the 'multiple' file input from your HTML
router.post("/announcement/add", upload.array('attachments'), addAnnouncement);
router.delete("/announcement/delete/:id", deleteAnnouncement);

// --- Important Links ---
router.post("/link/add", addLink);
router.delete("/link/delete/:id", deleteLink);

export default router;