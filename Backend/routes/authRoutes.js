import express from "express";
const router = express.Router();

import {
  staffLogin,
  studentLogin
} from "../controllers/authController.js";

router.post("/staff-login", staffLogin);
router.post("/student-login", studentLogin);

export default router;
