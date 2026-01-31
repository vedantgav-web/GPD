import mysql from "mysql2/promise";
import dotenv from "dotenv";

// Skip dotenv on Vercel to prevent crashes
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
  // CRITICAL: Aiven will reject connections without this
  ssl: {
    rejectUnauthorized: false,
  }
});

export default pool;
