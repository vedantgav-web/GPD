import pool from "../db.js";

/* ================= STAFF LOGIN ================= */
// export const staffLogin = async (req, res) => {
//   const { username, password } = req.body;

//   try {
//     const [rows] = await pool.query(
//       "SELECT * FROM staff WHERE username = ? AND password = ?",
//       [username, password]
//     );

//     if (rows.length === 0) {
//       return res.status(401).json({ message: "Invalid Credentials" });
//     }

//     res.json({
//       message: "Staff Login Successful",
//       staff: rows[0]
//     });
//   } catch (err) {
//     console.error(err);
//     res.status(500).json({ message: "Server Error" });
//   }
// };

import bcrypt from "bcryptjs"; // Make sure this is installed: npm install bcryptjs

/* ================= STAFF LOGIN (Updated for Hashed Passwords) ================= */
export const staffLogin = async (req, res) => {
  const { username, password } = req.body;

  try {
    // 1. Fetch user by username ONLY
    const [rows] = await pool.query(
      "SELECT * FROM staff WHERE username = ?",
      [username]
    );

    // 2. Check if user exists
    if (rows.length === 0) {
      return res.status(401).json({ message: "Invalid Username or Password" });
    }

    const staff = rows[0];

    // 3. Compare the plain-text password with the hash in the database
    const isMatch = await bcrypt.compare(password, staff.password);

    if (!isMatch) {
      return res.status(401).json({ message: "Invalid Username or Password" });
    }

    // 4. Success! (Remove password from object before sending to frontend)
    const { password: _, ...staffData } = staff;

    res.json({
      message: "Staff Login Successful",
      staff: staffData
    });

  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server Error" });
  }
};

/* ================= STUDENT LOGIN ================= */
/* ================= STUDENT LOGIN ================= */
export const studentLogin = async (req, res) => {
  // 1. Get phone_no from req.body (matching what backend1.js sends)
  const { enrollment_no, phone_no } = req.body; 

  try {
    const [rows] = await pool.query(
      "SELECT * FROM student WHERE enrollment_no = ?",
      [enrollment_no]
    );

    if (rows.length === 0) {
      return res.status(401).json({ success: false, message: "Invalid Enrollment Number" });
    }

    // 2. Check phone_no instead of password
    if (rows[0].phone_no !== phone_no) {
      return res.status(401).json({ success: false, message: "Invalid Phone Number (Password)" });
    }
    res.json({
      success: true,
      enrollment_no: rows[0].enrollment_no,
      name: rows[0].name
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server Error" });
  }
};

