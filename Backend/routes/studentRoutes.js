import express from "express";
import { addStudent ,updateStudent,deleteStudent} from "../controllers/studentController.js";

const router = express.Router();

// Route: POST /api/students/add
router.post("/addStudent", addStudent);
router.put("/updateStudent", updateStudent);
router.delete("/deleteStudent/:enrollment_no", deleteStudent);

export default router;