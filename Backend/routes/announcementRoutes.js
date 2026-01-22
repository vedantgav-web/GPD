import express from "express";
import pool from "../db.js";

const router = express.Router();

// GET all announcements
router.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT * FROM announcements ORDER BY created_at DESC"
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server error" });
  }
});

export default router;
