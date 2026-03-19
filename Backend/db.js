import mysql from "mysql2/promise";

const pool = mysql.createPool({
  uri: process.env.DATABASE_URL, // Ensure this matches your Vercel key name
  ssl: {
    rejectUnauthorized: false, // This is required for Aiven connections
  },
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

export default pool;
