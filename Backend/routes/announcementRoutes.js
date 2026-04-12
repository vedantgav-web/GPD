import express from "express";
import pool from "../db.js";

const router = express.Router();

// GET all announcements
// GET announcements filtered by branch and semester
router.get("/", async (req, res) => {
  // Extract parameters
  const studentBranch = req.query.branch;
  const studentSemester = req.query.semester;

  try {
    const sql = `
      SELECT * FROM announcements 
      WHERE 
        (branch IS NULL OR branch = '' OR branch = 'All' OR branch = ?) 
        AND 
        (semester IS NULL OR semester = '' OR semester = 'All' OR semester = ?)
      ORDER BY created_at DESC
    `;

    // If studentBranch or studentSemester are undefined/null, 
    // we pass an empty string so the '?' doesn't break the query.
    const [rows] = await pool.query(sql, [studentBranch || "", studentSemester || ""]);
    
    res.json(rows);
  } catch (err) {
    console.error("Backend Fetch Error:", err);
    res.status(500).json({ message: "Server error" });
  }
});
export default router;
