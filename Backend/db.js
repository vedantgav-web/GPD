import mysql from "mysql2/promise";
import dotenv from "dotenv";

// 1. Only run dotenv locally. Vercel provides env vars automatically.
if (process.env.NODE_ENV !== 'production') {
    dotenv.config();
}

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT || 21761,
  waitForConnections: true,
  connectionLimit: 10,
  // 2. Aiven REQUIREMENT: You MUST include this SSL block
  ssl: {
    rejectUnauthorized: false,
  }
});

export default pool;
