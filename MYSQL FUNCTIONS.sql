ALTER TABLE Persons 
ADD COLUMN DOB DATE;
CREATE FUNCTION CalculateAge(@DOB DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @DOB, GETDATE()) - 
           CASE 
               WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR 
                    (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
               THEN 1 
               ELSE 0 
           END
END;
SELECT 
    PersonID, 
    FirstName, 
    LastName, 
    DOB, 
    dbo.CalculateAge(DOB) AS Age
FROM Persons;
SELECT 
    CountryName, 
    LEN(CountryName) AS CountryNameLength
FROM Country;
SELECT 
    CountryName, 
    LEFT(CountryName, 3) AS FirstThreeChars
FROM Country;
SELECT 
    CountryName, 
    UPPER(CountryName) AS CountryNameUpperCase,
    LOWER(CountryName) AS CountryNameLowerCase
FROM Country;