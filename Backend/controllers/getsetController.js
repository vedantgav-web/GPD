import pool from "../db.js";

/* ================= get staff data ================= */

export const getStaffProfile = async (req, res) => {
  const { username } = req.params;
  try {
    const [rows] = await pool.query("SELECT * FROM staff WHERE username = ?", [username]);
    if (rows.length === 0) return res.status(404).json({ message: "Staff not found" });
    
    res.json(rows[0]); 
  } catch (err) {
    res.status(500).json({ message: "Server error" });
  }
};
/* ================= update staff data ================= */

export const updateStaffProfile = async (req, res) => {
  const { username } = req.params; // Get username from URL
  const { full_name, phone, email } = req.body; // Get new data from form

  try {
    const [result] = await pool.query(
      "UPDATE staff SET full_name = ?, phone = ?, email = ? WHERE username = ?",
      [full_name, phone, email, username]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Staff member not found" });
    }

    res.json({ success: true, message: "Profile updated successfully!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Database error during update" });
  }
};

/* ================= get student data ================= */
export const getStudentProfile = async (req, res) => {
  try {
    
     const { enrollment_no } = req.params;

    const [rows] = await pool.query(
      "SELECT * FROM student WHERE enrollment_no = ?",
      [enrollment_no]
    );

    if (rows.length === 0) {
      return res.status(404).json({ message: "Student not found" });
    }

    res.json(rows[0]);
  } catch (err) {
  console.error("Student Route Error:", err);
  res.status(500).json({
    message: "Server error",
    error: err.message
  });
}

};

export const updateStudentProfile = async (req, res) => {
  const { enrollment_no } = req.params;
  const { name, email, phone_no, parents_phone_no, address,roll_no,semester } = req.body;

  try {
    const [result] = await pool.query(
      "UPDATE student SET name = ?, email = ?, phone_no = ?, parents_phone_no = ?, address = ?,roll_no = ?,semester = ? WHERE enrollment_no = ?",
      [name, email, phone_no, parents_phone_no, address, roll_no,semester,enrollment_no]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Student not found" });
    }
    res.json({ success: true, message: "Student updated successfully!" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Database error" });
  }
};