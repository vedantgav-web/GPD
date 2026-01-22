import express from "express";
import pool from "../db.js";

const router = express.Router();

/* ================== GET IMAGES ================== */
router.get("/images", async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT image, album_name FROM image"
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Failed to load images" });
  }
});

/* ================== GET LINKS ================== */
router.get("/links", async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT name AS title, link FROM links"
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Failed to load links" });
  }
});

export default router;
