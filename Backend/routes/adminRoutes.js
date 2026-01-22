import express from "express";
import { addAdmin,updateAdmin,deleteAdmin } from "../controllers/adminController.js";

const router = express.Router();

// Route: POST /api/students/add
router.post("/addAdmin", addAdmin);
router.put("/updateAdmin", updateAdmin);
router.delete("/deleteAdmin/:username", deleteAdmin);

export default router;