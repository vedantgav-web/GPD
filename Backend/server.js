import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import fs from "fs";

// Route Imports
import authRoutes from "./routes/authRoutes.js";
import announcementRoutes from "./routes/announcementRoutes.js";
import commonRoutes from "./routes/commonRoutes.js";
import getsetRoutes from "./routes/getsetRoute.js";
import studentRoutes from "./routes/studentRoutes.js";
import adminRoutes from "./routes/adminRoutes.js";
import contentRoutes from "./routes/contentRoutes.js"; 
import galleryRoutes from "./routes/galleryRoutes.js"; // Separate Gallery Routes
import adminViewRoutes from "./routes/adminViewRoutes.js";
import resultRoutes from "./routes/resultRoutes.js";

import alumniRoutes from './routes/alumniRoutes.js';

dotenv.config();
const app = express();

// --- Middleware ---
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// --- Static Files ---
app.use("/uploads", express.static("uploads"));

// --- API Routes ---
app.use("/api/auth", authRoutes);
app.use("/api/announcements", announcementRoutes);
app.use("/api/common", commonRoutes);
app.use("/api/getset", getsetRoutes);
app.use("/api/students", studentRoutes);
app.use("/api/admins", adminRoutes);
app.use("/api/admin-view", adminViewRoutes);
app.use("/api/results", resultRoutes);
// The split logic:
app.use("/api/content", contentRoutes); // For Announcements and Links
app.use("/api/gallery", galleryRoutes); // For Photos/Images only
app.use('/api/exstudents', alumniRoutes);
export default app;

const PORT = process.env.SERVER_PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
