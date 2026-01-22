import express from "express";
import { getDashboardData } from "../controllers/adminViewController.js";

const router = express.Router();

// This will be accessible at /api/admin-view/all
router.get("/all", getDashboardData);

export default router;