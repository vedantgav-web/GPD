import mysql from "mysql2/promise";

const pool = mysql.createPool({
    uri: process.env.DATABASE_URL,
    ssl: {
        // This is the "magic" setting for Aiven. 
        // It tells the driver to use SSL but not to worry about the CA certificate file.
        rejectUnauthorized: false 
    },
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    // Helps prevent the "A server error occurred" 500 error on long-running queries
    connectTimeout: 10000 
});

export default pool;
