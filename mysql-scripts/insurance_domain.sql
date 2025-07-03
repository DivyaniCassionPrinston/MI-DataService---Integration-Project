CREATE DATABASE IF NOT EXISTS insurance;
USE insurance;

CREATE TABLE employees (
    employee_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role VARCHAR(50),
    email VARCHAR(150),
    phone VARCHAR(20),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER auto_increment_employee_id 
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    DECLARE next_id INT;
    SELECT COALESCE(MAX(CAST(SUBSTRING(employee_id, 3) AS UNSIGNED)), 0) + 1 
    INTO next_id FROM employees WHERE employee_id REGEXP '^E_[0-9]+';
    SET NEW.employee_id = CONCAT('E_', LPAD(next_id, 3, '0'));
END;
//
DELIMITER ;

INSERT INTO employees VALUES
('E_001', 'Alice', 'Fernando', 'Claims Officer', 'alice@insure.com', '0771234567', '123 Colombo Rd', NOW()),
('E_002', 'Bob', 'Silva', 'Underwriter', 'bob@insure.com', '0772345678', '456 Galle Rd', NOW()),
('E_003', 'Carol', 'Perera', 'Agent', 'carol@insure.com', '0773456789', '789 Kandy Rd', NOW()),
('E_004', 'Dan', 'Rajan', 'Claims Officer', 'dan@insure.com', '0774567890', 'Trinco Rd', NOW()),
('E_005', 'Eve', 'Kumaran', 'Auditor', 'eve@insure.com', '0775678901', 'Anuradhapura', NOW());
