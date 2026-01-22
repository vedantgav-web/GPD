import pool from "../db.js";

export const addStudent = async (req, res) => {
  // 1. Log the data to the console so you can see it in VS Code
  


  const { name, enrollment_no, roll_no, branch, semester,academic_year, phone_no, email} = req.body;

 const getTableName = (branch, semester) => {
    const codes = { "Computer": "co", "Civil": "ce", "Mechanical": "me", "Electrical": "ee" , "Electronics And Telecommunication":"ej" , "Automobile":"ae","Dress Designing":"dd"};
    return `${codes[branch] || 'XX'}_${semester}`;
};
  try {
    // 2. Check if student already exists
    const [existing] = await pool.query("SELECT * FROM student WHERE enrollment_no = ?", [enrollment_no]);
    if (existing.length > 0) {
      return res.status(400).json({ message: "Student with this Enrollment No already exists!" });
    }

    // 3. Insert into database
    // We ONLY insert the columns we have data for. 
    // The database will automatically set 'address' and 'parents_phone_no' to NULL.
    const query = `
      INSERT INTO student 
      (name, enrollment_no, roll_no, branch, semester,academic_year, phone_no, email) 
      VALUES (?, ?, ?, ?,?, ?, ?, ?)
    `;

    const values = [name, enrollment_no, roll_no, branch, semester,academic_year, phone_no, email];

    await pool.query(query, values);

    // 2. THE AUTO-ROW: Create the blank entry in the specific academic table
        const tableName = getTableName(branch, semester);
        
        // We only insert Enrollment and Year. All subject columns stay NULL/0 initially.
        const resultQuery = `INSERT INTO ${tableName} (enrollment_no, academic_year) VALUES (?, ?)`;
        await pool.query(resultQuery, [enrollment_no, academic_year]);

    console.log("✅ Student added to database!");
    res.status(201).json({ message: "Student added successfully" });

  } catch (err) {
    // 4. Print the EXACT error to your terminal
    console.error("❌ DATABASE ERROR:", err); 
    res.status(500).json({ message: "Database error", error: err.message });
  }
};


/* ================= UPDATE STUDENT (SAFER VERSION) ================= */
export const updateStudent = async (req, res) => {
  const { enrollment_no, name, roll_no, branch, semester, phone_no, email } = req.body;
  

  try {
    // 1. First, check if the student exists
    const [existing] = await pool.query("SELECT * FROM student WHERE enrollment_no = ?", [enrollment_no]);
    
    if (existing.length === 0) {
      return res.status(404).json({ message: "Student not found with that Enrollment No." });
    }

    // 2. Build the query dynamically. 
    // We only add fields to the query if they contain data (are not empty strings).
    let updates = [];
    let values = [];

    if (name && name.trim() !== "") {
      updates.push("name = ?");
      values.push(name);
    }
    if (roll_no && roll_no.trim() !== "") {
      updates.push("roll_no = ?");
      values.push(roll_no);
    }
    if (branch && branch.trim() !== "") {
      updates.push("branch = ?");
      values.push(branch);
    }
    if (semester && semester.trim() !== "") {
      updates.push("semester = ?");
      values.push(semester);
    }
    if (phone_no && phone_no.trim() !== "") {
      updates.push("phone_no = ?");
      values.push(phone_no);
    }
    if (email && email.trim() !== "") {
      updates.push("email = ?");
      values.push(email);
    }

    // If no fields were provided to update, stop here.
    if (updates.length === 0) {
      return res.status(400).json({ message: "No fields provided to update." });
    }

    // 3. Add the enrollment_no to the end of the values array for the WHERE clause
    values.push(enrollment_no);

    // 4. Construct the final SQL query
    // Example result: "UPDATE student SET roll_no = ? WHERE enrollment_no = ?"
    const sql = `UPDATE student SET ${updates.join(", ")} WHERE enrollment_no = ?`;

    await pool.query(sql, values);

    res.json({ message: "Student updated successfully!" });

  } catch (err) {
    console.error("Error updating student:", err);
    res.status(500).json({ message: "Database error", error: err.message });
  }
};

/* ================= DELETE STUDENT ================= */
export const deleteStudent = async (req, res) => {
  const { enrollment_no } = req.params; // We get this from the URL

  try {
    const [result] = await pool.query("DELETE FROM student WHERE enrollment_no = ?", [enrollment_no]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Student not found" });
    }

    res.json({ message: "Student deleted successfully!" });
  } catch (err) {
    console.error("Error deleting student:", err);
    res.status(500).json({ message: "Database error", error: err.message });
  }
};