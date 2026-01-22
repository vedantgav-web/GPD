import express from 'express';
import pool from '../db.js';

const router = express.Router();

// Search for Passed Out students only
router.get('/search-ex', async (req, res) => {
    const { query } = req.query;
    
    if (!query) {
        return res.status(400).json({ message: "Search query is required" });
    }

    try {
        const sql = `
            SELECT * FROM student 
            WHERE status = 'Passed Out' 
            AND (enrollment_no LIKE ? OR name LIKE ?)
            ORDER BY academic_year DESC
        `;
        const searchVal = `%${query}%`;
        const [results] = await pool.query(sql, [searchVal, searchVal]);
        
        res.json(results);
    } catch (err) {
        console.error("Archive Search Error:", err);
        res.status(500).json({ message: "Server error searching archive" });
    }
});

export default router;