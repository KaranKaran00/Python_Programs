CREATE DATABASE IF NOT EXISTS db1;

USE db1;

CREATE TABLE IF NOT EXISTS student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    semester INT,
    division VARCHAR(20)
);


//services.msc 
//conf