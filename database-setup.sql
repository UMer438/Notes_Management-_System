-- Create database
CREATE DATABASE IF NOT EXISTS notesdb;
USE notesdb;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    dob VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create notes table
CREATE TABLE IF NOT EXISTS notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    username VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

-- Create admins table
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default admin account (username: admin, password: admin123)
INSERT INTO admins (username, password) VALUES ('admin', 'admin123')
ON DUPLICATE KEY UPDATE username=username;

-- Insert sample user for testing (username: testuser, password: test123)
INSERT INTO users (username, password, email, fullName, dob) 
VALUES ('testuser', 'test123', 'test@example.com', 'Test User', '1990-01-01')
ON DUPLICATE KEY UPDATE username=username;

-- Insert sample notes for testing
INSERT INTO notes (title, content, username) VALUES 
('Welcome Note', 'Welcome to Notes Management System! This is your first note.', 'testuser'),
('Meeting Notes', 'Discuss project timeline and deliverables for Q1 2025.', 'testuser'),
('Shopping List', 'Milk, Eggs, Bread, Coffee, Fruits', 'testuser')
ON DUPLICATE KEY UPDATE id=id;

-- Display tables
SHOW TABLES;

-- Display counts
SELECT 'Users' as TableName, COUNT(*) as Count FROM users
UNION ALL
SELECT 'Notes' as TableName, COUNT(*) as Count FROM notes
UNION ALL
SELECT 'Admins' as TableName, COUNT(*) as Count FROM admins;
