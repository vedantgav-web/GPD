import pool from "../db.js";

export const getClassResults = async (req, res) => {
    const { branch, sem, year } = req.query;
    const codes = { 
        "Computer": "co", 
        "Civil": "ce", 
        "Mechanical": "me", 
        "Electrical": "ee", 
        "Electronics And Telecommunication": "ej" 
    };
    const tableName = `${codes[branch]}_${sem}`;

    try {
        const query = `
            SELECT s.name, s.enrollment_no, r.* FROM student s
            JOIN ${tableName} r ON s.enrollment_no = r.enrollment_no
            WHERE s.branch = ? AND r.academic_year = ?
        `;
        const [rows] = await pool.query(query, [branch, year]);
        res.json(rows);
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Error fetching class", error: err.message });
    }
};
export const saveMarks = async (req, res) => {
    const { branch, sem, year, allData } = req.body;
    const codes = { 
    "Computer": "co", 
    "Electronics And Telecommunication": "ej",
    "Electrical": "ee", 
    "Civil": "ce", 
    "Mechanical": "me",
    "Automobile": "ae",
    "Dress Designing": "dd"
};
    const tableName = `${codes[branch]}_${sem}`.toLowerCase();

    try {
        // --- STEP 1: SAVE INDIVIDUAL MARKS ---
        for (let record of allData) {
            const { enrollment_no, max_total_marks, ...fields } = record;
            
            let totalObtained = 0;
            Object.entries(fields).forEach(([key, val]) => {
                if (key !== 'result_status' && key !== 'seat_no' && key !== 'rank_no' && val && !isNaN(val)) {
                    totalObtained += parseInt(val);
                }
            });

            const maxVal = parseInt(max_total_marks) || 1;
            const percentage = ((totalObtained / maxVal) * 100).toFixed(2);
            
            const finalUpdateData = { 
                ...fields, 
                max_total_marks: maxVal,
                total_marks_obtained: totalObtained, 
                percentage: percentage
            };

            const entries = Object.entries(finalUpdateData).filter(([_, v]) => v !== null);
            const columns = entries.map(([key]) => `\`${key}\` = ?`).join(", ");
            const values = [...entries.map(([_, v]) => v), enrollment_no, year];

            await pool.query(`UPDATE ${tableName} SET ${columns} WHERE enrollment_no = ? AND academic_year = ?`, values);
        }

        // --- STEP 2: CALCULATE RANKINGS FOR THIS SEMESTER ---
await pool.query(`SET @r=0;`);
const rankQuery = `
    UPDATE ${tableName} 
    SET rank_no = (@r := @r + 1) 
    WHERE academic_year = ? 
    ORDER BY percentage DESC
`;
await pool.query(rankQuery, [year]);

        // --- STEP 3: PROMOTION LOGIC ---
        for (let record of allData) {
            const { enrollment_no, result_status } = record;

            if (result_status && result_status.toUpperCase() !== 'FAIL') {
                const [student] = await pool.query("SELECT semester, branch FROM student WHERE enrollment_no = ?", [enrollment_no]);

                if (student.length > 0) {
                    const currentSemFromDB = parseInt(student[0].semester);
                    const studentBranch = student[0].branch;

                    // Only promote if the staff is saving marks for the student's CURRENT semester
                    // This prevents double-promotion if staff re-saves old marks
                    if (currentSemFromDB === parseInt(sem)) {
                        if (currentSemFromDB < 6) {
                            const nextSem = currentSemFromDB + 1;
                            const nextTableName = `${codes[studentBranch]}_${nextSem}`.toLowerCase();

                            await pool.query("UPDATE student SET semester = ? WHERE enrollment_no = ?", [nextSem, enrollment_no]);
                            await pool.query(`INSERT IGNORE INTO ${nextTableName} (enrollment_no, academic_year) VALUES (?, ?)`, [enrollment_no, year]);
                        } else {
                            await pool.query("UPDATE student SET status = 'Passed Out' WHERE enrollment_no = ?", [enrollment_no]);
                        }
                    }
                }
            }
        }

        res.json({ message: "Successfully updated marks, calculated ranks, and promoted eligible students!" });
    } catch (err) {
        console.error("SQL ERROR:", err.message);
        res.status(500).json({ message: "Database Error", error: err.message });
    }
};
export const getTableColumns = async (req, res) => {
    const { branch, sem } = req.query;
    const codes = { 
    "Computer": "co", 
    "Electronics And Telecommunication": "ej", 
    "Electrical": "ee", 
    "Civil": "ce", 
    "Mechanical": "me",
    "Automobile": "ae",
    "Dress Designing": "dd"
};
    const tableName = `${codes[branch]}_${sem}`.toLowerCase();

    try {
        const [columns] = await pool.query(`DESCRIBE ${tableName}`);
        
        // These are management columns we don't want the user to type in
        const excluded = ['id', 'enrollment_no', 'name', 'academic_year', 'total_marks_obtained', 'percentage', 'result_status', 'grade', 'rank_no'];
        
        const marksColumns = columns
            .map(col => col.Field)
            .filter(name => !excluded.includes(name))
            // .sort(); // Sorting puts English_FA, English_SA, English_SLA next to each other

        res.json(marksColumns);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
// Controller function to fetch history from dynamic tables (co_1, ej_2, etc.)
export const getStudentAcademicHistory = async (req, res) => {
    try {
        const { enrollment } = req.params;

        // 1. Fetch student including the 'status' column
        const [students] = await pool.query(
            "SELECT name, enrollment_no, branch, semester, status FROM student WHERE enrollment_no = ?", 
            [enrollment]
        );
        
        if (students.length === 0) {
            return res.status(404).json({ message: "Student record not found" });
        }

        const student = students[0];
        
        
        const codes = { 
    "Computer": "co", 
    "Electronics And Telecommunication": "ej", // Ensure this matches your DB string exactly
    "Electrical": "ee", 
    "Civil": "ce", 
    "Mechanical": "me",
    "Automobile": "ae",
    "Dress Designing": "dd"
};

        const branchCode = codes[student.branch] || student.branch.toLowerCase();
        
        // --- THE FIX ---
        // If status is 'Passed Out', we force the loop to go up to 6.
        // If not, we go up to the current semester.
        let maxSem;
        if (student.status === 'Passed Out') {
            maxSem = 6;
        } else {
            maxSem = parseInt(student.semester);
        }

        let academicHistory = [];

        // Use i <= maxSem to include the current/final semester marks
        for (let i = 1; i <= maxSem; i++) {
            const tableName = `${branchCode}_${i}`.toLowerCase();
            
            try {
                const [record] = await pool.query(
                    `SELECT * FROM ${tableName} WHERE enrollment_no = ?`, 
                    [enrollment]
                );
                
                if (record.length > 0) {
                    const data = record[0];
                    data.semester_label = i; 
                    academicHistory.push(data);
                }
            } catch (tableErr) {
                console.warn(`Warning: Table ${tableName} could not be queried.`);
            }
        }

        res.status(200).json({
            student: student,
            marks: academicHistory
        });

    } catch (error) {
        console.error("Critical Controller Error:", error);
        res.status(500).json({ message: "Internal Server Error", error: error.message });
    }
};