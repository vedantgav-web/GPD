import express from "express";
const router = express.Router();

import {
    getStaffProfile,
    updateStaffProfile,
    getStudentProfile,
    updateStudentProfile
} from "../controllers/getsetController.js";

router.get("/staff/:username", getStaffProfile);
router.get("/student/:enrollment_no", getStudentProfile);
router.put("/staff-update/:username", updateStaffProfile);
router.put("/student-update/:enrollment_no", updateStudentProfile);

export default router;
