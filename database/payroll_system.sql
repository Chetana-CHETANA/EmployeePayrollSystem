CREATE DATABASE IF NOT EXISTS payroll_system
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE payroll_system;

DROP TABLE IF EXISTS payroll;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS admin;

CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO admin(username, password)
VALUES ('admin', 'password123');

CREATE TABLE departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    designation VARCHAR(100) NOT NULL,
    basic_salary DECIMAL(12,2) NOT NULL DEFAULT 0,
    department_id INT NOT NULL,
    phone_no VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id) REFERENCES departments(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE payroll (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    month CHAR(7) NOT NULL,
    basic_salary DECIMAL(12,2) NOT NULL,
    allowance DECIMAL(12,2) NOT NULL DEFAULT 0,
    deductions DECIMAL(12,2) NOT NULL DEFAULT 0,
    gross_salary DECIMAL(12,2) NOT NULL,
    net_salary DECIMAL(12,2) NOT NULL,
    payment_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Paid',
    CONSTRAINT fk_payroll_employee
        FOREIGN KEY (employee_id) REFERENCES employees(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO departments(department_name, description) VALUES
('Human Resources', 'People and employee operations'),
('IT', 'Technology and software development'),
('Finance', 'Accounting and finance operations');

INSERT INTO employees(full_name,email,designation,basic_salary,department_id,phone_no)
VALUES
('Aarav Sharma','aarav@example.com','Software Engineer',50000,2,'9876543210'),
('Priya Patil','priya@example.com','HR Executive',35000,1,'9876543211');
