import express from "express";
import pool from "../db.js";

const router = express.Router();

// GET all announcements
// GET announcements filtered by branch and semester
router.get("/", async (req, res) => {
  // Extract branch and semester from the URL query (e.g., /announcements?branch=Computer&semester=4)
  const { branch, semester } = req.query;

  try {
    // SQL Logic: 
    // 1. Show if branch is NULL or empty (Global announcement) OR matches student's branch
    // 2. AND show if semester is NULL or empty (Global) OR matches student's semester
    const sql = `
      SELECT * FROM announcements 
      WHERE (branch IS NULL OR branch = '' OR branch = ?) 
      AND (semester IS NULL OR semester = '' OR semester = ?)
      ORDER BY created_at DESC
    `;

    // We pass the branch and semester twice to fill the '?' placeholders
    const [rows] = await pool.query(sql, [branch, semester]);
    
    res.json(rows);
  } catch (err) {
    console.error("Backend Fetch Error:", err);
    res.status(500).json({ message: "Server error" });
  }
});
export default router;
