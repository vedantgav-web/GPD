import express from "express";
import { 
    getClassResults, 
    saveMarks, 
    getTableColumns, 
    getStudentAcademicHistory 
} from "../controllers/resultController.js"; // Use curly braces for named exports

const router = express.Router();

router.get("/get-class", getClassResults);
router.post("/save-marks", saveMarks);
router.get("/get-columns", getTableColumns);
router.get('/student/:enrollment', getStudentAcademicHistory);

export default router;