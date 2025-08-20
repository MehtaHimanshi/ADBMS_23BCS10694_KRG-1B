CREATE TABLE deptt (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employee3 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES deptt(id)
);

INSERT INTO deptt VALUES
(1, 'IT'),
(2, 'SALES');

INSERT INTO employee3 VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'JOE2', 90000, 1);
SELECT e.id, e.name, d.dept_name, e.salary
FROM deptt AS d
JOIN employee3 AS e
ON d.id = e.department_id
WHERE e.salary IN 
(
    SELECT MAX(salary)
    FROM employee3
    GROUP BY department_id
);
/*SELECT e.id, e.name, d.dept_name, e.salary
FROM deptt AS d
JOIN employee3 AS e
ON d.id = e.department_id
WHERE e.salary = 
(
    SELECT MAX(e2.salary)
    FROM employee3 AS e2
    WHERE e2.department_id = e.department_id
);*/
--HARD
CREATE TABLE A(
EmpID int primary key,
Ename varchar(10),
Salary int
);

CREATE TABLE B(
EmpID int primary key,
Ename varchar(10),
Salary int
);

INSERT INTO A VALUES
(1,'Himanshi',1000),
(2,'Mehta',300);

INSERT INTO B VALUES
(2,'Mehta',400),
(3,'Palak',100);


SELECT EmpID, Ename, min(Salary) as Min_Salary
FROM
(SELECT* FROM A
UNION
SELECT* FROM B) AS X
GROUP BY EmpID, Ename;  
