// db.js
import mysql from "mysql2/promise";
import dotenv from "dotenv";

// Only load .env file if we are NOT on Vercel
if (process.env.NODE_ENV !== 'production') {
    dotenv.config();
}

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT || 21761, // Use your Aiven port
  waitForConnections: true,
  connectionLimit: 10,
  // Aiven REQUIRED: 
  ssl: {
    rejectUnauthorized: false, 
  }
});

export default pool;
