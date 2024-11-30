DELIMITER //

CREATE PROCEDURE sp_AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (
        Worker_Id, 
        FirstName, 
        LastName, 
        Salary, 
        JoiningDate, 
        Department
    ) VALUES (
        p_Worker_Id, 
        p_FirstName, 
        p_LastName, 
        p_Salary, 
        p_JoiningDate, 
        p_Department
    );
END //

DELIMITER ;

-- Procedure Call Example
CALL sp_AddWorker(1, 'John', 'Doe', 50000, '2024-01-15', 'HR');
DELIMITER //

CREATE PROCEDURE sp_GetSalaryById(
    IN p_Worker_Id INT,
    OUT p_Salary INT(15)
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- Procedure Call Example
CALL sp_GetSalaryById(1, @salary);
SELECT @salary AS Worker_Salary;
DELIMITER //

CREATE PROCEDURE sp_UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- Procedure Call Example
CALL sp_UpdateDepartment(1, 'IT');
DELIMITER //

CREATE PROCEDURE sp_CountWorkersInDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

-- Procedure Call Example
CALL sp_CountWorkersInDepartment('HR', @workerCount);
SELECT @workerCount AS Workers_in_Department;
DELIMITER //

CREATE PROCEDURE sp_AvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

-- Procedure Call Example
CALL sp_AvgSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary AS Average_Salary_in_Department;
