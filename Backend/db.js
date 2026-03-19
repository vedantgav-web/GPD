import mysql from "mysql2/promise";

// This uses the single DATABASE_URL you added to Vercel
const pool = mysql.createPool(process.env.DATABASE_URL);

export default pool;
