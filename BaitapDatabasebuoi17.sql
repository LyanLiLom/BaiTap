CREATE DATABASE qlNhanvien;
use qlNhanvien;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    salary DECIMAL(10, 2),
    start_date DATE,
    department_id INT
);

CREATE TABLE access_rights (
    access_id INT PRIMARY KEY,
    employee_id INT,
    access_level VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

INSERT INTO employees (employee_id, employee_name, salary, start_date, department_id)
VALUES
	(6, 'Charlie Push', 65000, '2020-12-01', 1),
    (1, 'John Doe', 60000, '2021-01-15', 1),
    (2, 'Jane Smith', 70000, '2020-05-20', 2),
    (3, 'Bob Johnson', 55000, '2022-03-10', 1),
    (4, 'Alice Williams', 80000, '2021-08-05', 3),
    (5, 'Charlie Brown', 65000, '2020-12-01', 2);   	

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'IT'),
    (2, 'Sales'),
    (3, 'HR');

INSERT INTO access_rights (access_id, employee_id, access_level)
VALUES
    (1, 1, 'Admin'),
    (2, 2, 'User'),
    (3, 3, 'User'),
    (4, 4, 'Admin'),
    (5, 5, 'User');

   
   --Câu 1
   SELECT *
   FROM employees ;
   
  --Câu 2
  SELECT employee_name, salary
  FROM employees ;
  
  --Câu 3
  SELECT *
  FROM employees 
  WHERE salary > 50000;
  
  --Câu4
  SELECT d.department_name,count(d.department_id) sl
  FROM employees e 
  JOIN departments d ON d.department_id = e.department_id 
  GROUP By d.department_name ;
  
  --Câu 5
  SELECT *
  FROM employees e
  ORDER BY employee_name ASC;
  
 --Câu 6
 SELECT e.employee_name ,e.salary ,d.department_name
 from employees e
 JOIN departments d on e.department_id = d.department_id
 WHERE e.salary BETWEEN 40000 and 60000;
 
 --Câu 7
 SELECT sum(e.salary) tongluong
 from employees e ;
 
 --Câu 8
 SELECT e.employee_name , d.department_name 
 FROM employees e 
 JOIN departments d ON d.department_id = e.department_id ;
 
 --Câu 9
 SELECT d.department_name ,count(e.department_id) slNV
 FROM departments d 
 JOIN employees e ON d.department_id = e.department_id
 GROUP BY d.department_name 
 HAVING  slNV >= 3;
 
 --Câu 10
 SELECT e.employee_name ,e.salary 
 FROM employees e 
 JOIN departments d ON d.department_id = e.department_id 
 WHERE d.department_id = 1 OR d.department_id = 2;
 
 --Câu 11
 SELECT e.employee_name , e.start_date 
 FROM employees e 
 WHERE year(e.start_date) >= 2020;
 
 --Câu 12
 SELECT sum(e.salary)/COUNT(e.salary) 
 FROM employees e ;
 
 --Câu 13
 SELECT d.department_name, count(e.department_id) slnv
 FROM employees e 
 LEFT JOIN departments d  ON d.department_id = e.department_id 
 GROUP BY d.department_name;
 
 --Câu 14
 SELECT *
 FROM employees e 
 ORDER BY e.salary DESC  
 LIMIT 5;
 
 --Câu 15
 SELECT *
 FROM employees e 
 WHERE e.employee_name  LIKE 'A%';
 
--Câu 16
SELECT e.employee_name ,ar.access_level 
FROM employees e 
JOIN access_rights ar ON e.employee_id = ar.employee_id 
WHERE ar.access_level = 'Admin';

--Câu 17
SELECT d.department_name  ,sum(e.salary) tong_luong
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
GROUP BY d.department_name 
ORDER BY tong_luong DESC;

--Câu 18
SELECT e.employee_name , e.start_date 
FROM employees e 
ORDER BY e.start_date ASC;

--Câu 19
SELECT d.department_name,max(e.salary) lonnhat
FROM employees e 
JOIN departments d ON d.department_id = e.department_id
GROUP BY d.department_name

--Câu 20
SELECT e.employee_name , ar.access_level 
FROM employees e 
LEFT JOIN access_rights ar ON ar.employee_id = e.employee_id;
