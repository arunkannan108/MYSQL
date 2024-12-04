-- Create teachers table
CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    experience DECIMAL(5,2),
    salary DECIMAL(10,2)
);

-- Create teacher_log table to track actions
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BEFORE INSERT TRIGGER: Prevent negative salary
DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;//
DELIMITER ;

-- AFTER INSERT TRIGGER: Log new teacher insertions
DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', CURRENT_TIMESTAMP);
END;//
DELIMITER ;

-- BEFORE DELETE TRIGGER: Prevent deletion of teachers with >10 years experience
DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END;//
DELIMITER ;

-- AFTER DELETE TRIGGER: Log teacher deletions
DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', CURRENT_TIMESTAMP);
END;//
DELIMITER ;

-- Insert sample data
INSERT INTO teachers (name, subject, experience, salary) VALUES 
('John Smith', 'Mathematics', 5.5, 55000),
('Emily Davis', 'English', 8.2, 62000),
('Michael Brown', 'Science', 3.7, 48000),
('Sarah Johnson', 'History', 12.5, 75000),
('David Wilson', 'Physics', 6.3, 58000),
('Lisa Martinez', 'Chemistry', 9.1, 65000),
('Robert Taylor', 'Computer Science', 4.6, 52000),
('Jennifer Lee', 'Biology', 7.9, 60000);