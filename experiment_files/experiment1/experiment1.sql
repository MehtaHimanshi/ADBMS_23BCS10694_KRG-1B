--EASY
CREATE TABLE TBL_AUTHOR
(
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(10),
    COUNTRY VARCHAR(10)
);

CREATE TABLE TBL_BOOK
(
    BOOK_ID INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(10),
    AUHTORID INT,
    FOREIGN KEY (AUHTORID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
);


INSERT INTO TBL_AUTHOR VALUES(101, 'Rahul', 'India');
INSERT INTO TBL_AUTHOR VALUES(103, 'Neha', 'India');

INSERT INTO TBL_BOOK VALUES(121, 'jiya', 103);
INSERT INTO TBL_BOOK VALUES(111, 'Shubham', 101);

INNER JOIN Query

SELECT B.BOOK_TITLE, A.AUTHOR_NAME AS 'AUTHOR NAME', A.COUNTRY
FROM TBL_BOOK AS B
INNER JOIN TBL_AUTHOR AS A 
ON B.AUHTORID = A.AUTHOR_ID;
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);
--MEDIUM
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);



INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

INSERT INTO Course VALUES
(101, 'Python Basics', 1),
(102, 'System Design', 1),
(103, 'Astrophysics', 2),
(104, 'Nano Science', 2),
(105, 'Matrix Theory', 3),
(106, 'Numerical Methods', 3),
(107, 'Inorganic Chemistry', 4),
(108, 'Bioinformatics', 4),
(109, 'Human Anatomy', 5),
(110, 'Cell Biology', 5);



SELECT DeptName
FROM Department
WHERE DeptID IN (
    SELECT DeptID
    FROM Course
    GROUP BY DeptID
    HAVING COUNT(*) > 2
);



CREATE LOGIN LOGIN_ABC
WITH PASSWORD = 'ABC@04';


CREATE USER ABC_04 FOR LOGIN LOGIN_ABC;

GRANT SELECT ON Course TO ABC_04;
