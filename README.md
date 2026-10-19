# Employee Payroll System

Technology:
- Java 17
- Jakarta Servlets 6
- JSP/JSTL
- Bootstrap 5
- JavaScript
- MySQL 8+/XAMPP
- Maven
- Apache Tomcat 10.1+

## 1. Database
Start MySQL in XAMPP, open phpMyAdmin and import:
`database/payroll_system.sql`

If your XAMPP MySQL has a password, edit:
`src/main/java/com/payroll/config/DatabaseConnection.java`

## 2. Build
Install JDK 17 and Maven, then run:
`mvn clean package`

The WAR will be:
`target/employee-payroll-system.war`

## 3. Deploy
Copy the WAR to Tomcat 10.1+ `webapps/`.
Start Tomcat.

Open:
`http://localhost:8080/employee-payroll-system/login`

Default:
username: admin
password: password123

## Security note
The requested database schema stores the default admin password as plain text for easy setup. For production, replace this with BCrypt/Argon2 password hashing and HTTPS.


## Change Username / Password Anytime
After login, open **Login Settings** from the sidebar. Both username and password are saved immediately to the `admin` table and can be changed whenever required.
