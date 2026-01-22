import pool from "../db.js";
import bcrypt from "bcryptjs";

// --- 1. ADD NEW ADMIN ---
export const addAdmin = async (req, res) => {
    const { username, password, full_name, phone, email } = req.body;

    try {
        // Hash password for security
        const hashedPassword = await bcrypt.hash(password, 10);

        const [result] = await pool.query(
            "INSERT INTO staff (username, password, full_name, phone, email) VALUES (?, ?, ?, ?, ?)",
            [username, hashedPassword, full_name, phone, email]
        );

        res.status(201).json({ success: true, message: "New Admin added successfully!" });
    } catch (err) {
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ message: "Username already exists." });
        }
        console.error(err);
        res.status(500).json({ message: "Database error while adding admin." });
    }
};

// --- 2. UPDATE ADMIN ---
// This allows updating details based on username
// --- UPDATE ADMIN (Smart Update) ---
export const updateAdmin = async (req, res) => {
    const { username, full_name, phone, email } = req.body;

    try {
        // Use COALESCE or IF logic to only update fields that aren't empty
        const [result] = await pool.query(
            `UPDATE staff SET 
             full_name = IF(NULLIF(?, '') IS NULL, full_name, ?),
             phone = IF(NULLIF(?, '') IS NULL, phone, ?),
             email = IF(NULLIF(?, '') IS NULL, email, ?)
             WHERE username = ?`,
            [full_name, full_name, phone, phone, email, email, username]
        );

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: "Admin not found." });
        }

        res.json({ success: true, message: "Admin details updated successfully!" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Error updating admin." });
    }
};

// --- 3. DELETE ADMIN ---
export const deleteAdmin = async (req, res) => {
    const { username } = req.params;

    try {
        // 1. Fetch the details of the admin we want to delete
        const [targetAdmin] = await pool.query("SELECT isAdmin FROM staff WHERE username = ?", [username]);

        if (targetAdmin.length === 0) {
            return res.status(404).json({ message: "Admin not found." });
        }

        // 2. Prevent deleting the Master Admin (assuming isAdmin = 1 is the Master)
        if (targetAdmin[0].isAdmin === 1) {
            return res.status(403).json({ 
                message: "Security Error: The Master Admin account cannot be deleted." 
            });
        }

        // 3. Optional: Double check total admin count anyway
        const [countResult] = await pool.query("SELECT COUNT(*) as total FROM staff");
        if (countResult[0].total <= 1) {
            return res.status(403).json({ message: "Cannot delete the last remaining admin." });
        }

        // 4. Proceed with deletion
        await pool.query("DELETE FROM staff WHERE username = ?", [username]);
        res.json({ success: true, message: "Admin removed successfully." });

    } catch (err) {
        console.error(err);
        res.status(500).json({ message: "Database error." });
    }
};