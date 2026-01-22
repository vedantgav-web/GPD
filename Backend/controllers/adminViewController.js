import pool from "../db.js";

export const getDashboardData = async (req, res) => {
    try {
        const [students] = await pool.query("SELECT * FROM student WHERE status != 'Passed Out' OR status IS NULL ORDER BY created_at DESC");
        const [announcements] = await pool.query("SELECT * FROM announcements ORDER BY created_at DESC");
        const [photos] = await pool.query("SELECT * FROM image ORDER BY image_id DESC");
        const [links] = await pool.query("SELECT * FROM links ORDER BY name ASC");
        const [staff] = await pool.query("SELECT * FROM staff ORDER BY created_at DESC");

        res.json({ students, announcements, photos, links, staff });
    } catch (err) {
        console.error("Database Error:", err);
        res.status(500).json({ message: "Error fetching data" });
    }
};