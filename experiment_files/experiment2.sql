--MEDIUM (ORGANISATIONAL HEIRARCHY)
CREATE TABLE EMPLOYEE(
EMP_ID INT PRIMARY KEY,
ENAME VARCHAR(10),
DEPT VARCHAR(10),
MANAGERID INT

FOREIGN KEY(MANAGERID) REFERENCES EMPLOYEE(EMP_ID)
);


/*ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE
FOREIGN KEY(MANAGERID) REFERENCES EMPLOYEE(EMP_ID)*/



INSERT INTO EMPLOYEE VALUES
(1, 'Alice', 'HR', NULL),
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT',1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR',1);


SELECT E1.ENAME AS [EMPLOYEE NAME], E1.DEPT AS [DEPARTMENT NAME], E2.ENAME AS [MANAGER'S NAME], E2.DEPT AS [MANAGER'S DEPARTMENT]
FROM EMPLOYEE AS E1
LEFT JOIN
EMPLOYEE AS E2
ON E1.MANAGERID=E2.EMP_ID


--HARD 
-- Create Year_tbl (holds actual NPV values)
CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

-- Create Queries table (requested values)
CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

-- Insert data into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

-- Insert data into Queries
INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

SELECT Q.ID, Q.YEAR, ISNULL(Y.NPV, 0) AS NPV
FROM Queries AS Q
LEFT JOIN Year_tbl AS Y
ON Q.ID = Y.ID AND Q.YEAR = Y.YEAR
ORDER BY Q.ID, Q.YEAR;