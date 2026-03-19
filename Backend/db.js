import mysql from "mysql2/promise";

// Use the full connection string from Vercel/Env
const pool = mysql.createPool(process.env.DATABASE_URL + "?ssl-mode=REQUIRED");

export default pool;
