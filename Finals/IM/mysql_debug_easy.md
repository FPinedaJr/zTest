### EASY Debugging Quiz
***NOTE:** it can be 'no error'*

1. ```sql
   SELECT name surname
   FROM employees;
   ```
2. ```sql
   SELECT * 
   FROM employees
   WHERE department = "IT";
   ```
3. ```sql
    SELECT EmployeeName
    FROM Employees
    ORDER BY DepartmentName ASC, DepartmentName DESC;
    ```
4. ```sql
   INSERT INTO employees (EmployeeID, EmployeeName, DepartmentID)
   VALUES (1, "John");
   ```
5. ```sql
   UPDATE employees
   SET EmployeeName = 'Jane'
   WHERE EmployeeID == 2;
   ```
6. ```sql
   DELETE FROM employees
   WHERE EmployeeName = 'Jake' AND DepartmentID = 103 OR DepartmentID = 101;
   ```
7. ```sql
   SELECT EmployeeID, EmployeeName, DepartmentName
   FROM employees
   JOIN departments
   ON employees.DepartmentID = Departments.DepartmentID;
   ```
8. ```sql
   SELECT EmployeeID, EmployeeName
   FROM employees
   WHERE EmployeeName LIKE '_a*';
   ```
9. ```sql
   CREATE TABLE employees (
       EmployeeID int NOT NULL,
       EmployeeName varchar(255),
       DepartmentID int,
       PRIMARY KEY EmployeeID
   );
   ```
10. ```sql
    SELECT * 
    FROM employees 
    WHERE DepartmentID BETWEEN 101 TO 104;
    ```
11. ```sql
    INSERT INTO employees VALUES ('John', 101);
    ```
12. ```sql
    CREATE INDEX idx_emp ON employees (EmployeeName DESC);
    ```
13. ```sql
    ALTER TABLE employees
    ADD EmployeeName TEXT NOT NULL;
    ```
14. ```sql
    SELECT MAX(EmployeeID, EmployeeName)
    FROM employees;
    ```
15. ```sql
    SELECT ROUND(Salary)
    FROM employees;
    ```
16. ```sql
    SELECT COALESCE(NULL, EmployeeName)
    FROM employees;
    ```
17. ```sql
    SELECT * FROM employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 5;
    ```
18. ```sql
    DROP TABLE employees IF EXISTS;
    ```
19. ```sql
    SELECT column_name(s)
    AS new_table
    FROM employees
    WHERE DepartmentID = 101;
    ```
20. ```sql
    SELECT FORMAT(EmployeeName, 'yyyy-MM-dd')
    FROM employees;
    ```
21. ```sql
    CREATE VIEW emp_view AS
    SELECT EmployeeID, EmployeeName
    FROM employees
    WHERE DepartmentID = 102;
    ```
22. ```sql
    SELECT EmployeeID, UCASE(DepartmentID)
    FROM employees;
    ```
23. ```sql
    CREATE TABLE departments (
        DepartmentID int,
        DepartmentName varchar(255),
        FOREIGN KEY (DepartmentID) REFERENCE employees(DepartmentID)
    );
    ```
24. ```sql
    INSERT INTO employees (EmployeeName, DepartmentID)
    VALUES ('John', 101), ('Jane', 'IT');
    ```
25. ```sql
    ALTER TABLE employees
    DROP COL Department;
    ```
26. ```sql
    CREATE UNIQUE INDEX idx_emp ON employees (EmployeeID, DepartmentID);
    ```
27. ```sql
    SELECT MID(EmployeeName, 3)
    FROM employees;
    ```
28. ```sql
    SELECT * 
    FROM employees
    WHERE EmployeeName NOT NULL;
    ```
29. ```sql
    DELETE FROM employees
    WHERE EmployeeID = NULL;
    ```
30. ```sql
    CREATE TABLE employees (
        EmployeeID int AUTO_INCREMENT PRIMARY KEY,
        EmployeeName varchar(255),
        DepartmentID int DEFAULT 'NULL'
    );
    ```
31. ```sql
    SELECT *
    FROM employees
    WHERE DepartmentID = 101;
    ORDER BY EmployeeName;
    ```
32. ```sql
    CREATE TABLE temp_emp AS
    SELECT EmployeeID, EmployeeName, DepartmentName
    FROM employees;
    ```
33. ```sql
    INSERT INTO employees (EmployeeName)
    VALUES ('Jane'), ('Jake');
    ```
34. ```sql
    ALTER TABLE employees
    MODIFY COLUMN DepartmentID varchar(10);
    ```
35. ```sql
    CREATE TABLE employees (
        EmployeeID int,
        EmployeeName varchar(255),
        CONSTRAINT fk_dept FOREIGN KEY (DepartmentID) REFERENCES departments(DepartmentID)
        ON DELETE SET DEFAULT
    );
    ```
36. ```sql
    SELECT AVG(Salary)
    FROM employees
    WHERE AVG(Salary) > 5000;
    ```
37. ```sql
    SELECT EmployeeID, EmployeeName
    FROM employees
    LEFT JOIN departments
    ON employees.DepartmentID == departments.DepartmentID;
    ```
38. ```sql
    CREATE TABLE employees (
        EmployeeID int,
        EmployeeName varchar(255),
        DepartmentID int NOT NULL,
        CONSTRAINT fk_dept FOREIGN KEY (DepartmentID) REFERENCES departments(DepartmentID)
    );
    ```
39. ```sql
    SELECT * 
    FROM employees
    WHERE EmployeeName IN 'John', 'Jane', 'Jake';
    ```
40. ```sql
    CREATE INDEX idx_salary
    ON employees;
    ```

### Answers

1. **name surname** (missing comma)
2. **"IT"** (technically it should use single quotes)
3. **NO ERROR** 
4. **VALUES (1, "John")** (missing value for DepartmentID)
5. **== 2** (should use a single equals sign)
6. **AND DepartmentID = 103 OR** (ambiguous condition, should use parentheses)
7. **NO ERROR** 
8. **'_a*'** (should be '_a%')
9. **PRIMARY KEY EmployeeID** (missing parentheses)
10. **BETWEEN 101 TO 104** (should be AND instead of TO)
11. **VALUES ('John', 101)** (missing EmployeeID)
12. **EmployeeName DESC** (DESC is not allowed in index creation)
13. **EmployeeName TEXT NOT NULL** (cannot alter a column to add NOT NULL)
14. **MAX(EmployeeID, EmployeeName)** (MAX function takes a single column)
15. **Salary** (the number of decimal places is missing)
16. **COALESCE(NULL, EmployeeName)** (NULL should be replaced with a column or value)
17. **GROUP BY DepartmentID HAVING COUNT(*) > 5** (incorrect usage in GROUP BY without SELECT)
18. **DROP TABLE employees IF EXISTS** (incorrect syntax, should be DROP TABLE IF EXISTS employees)
19. **AS** (should be INTO)
20. **FORMAT(EmployeeName, 'yyyy-MM-dd')** (FORMAT is for numbers, not strings)
21. **NO ERROR**
22. **UCASE(DepartmentID)** (UCASE should be used for string columns)
23. **FOREIGN KEY (DepartmentID) REFERENCE employees(DepartmentID)** (should be REFERENCES)
24. **('John', 101), ('Jane', 'IT')** (mismatched data types)
25. **DROP COL Department** (should be COLUMN)
26. **CREATE UNIQUE INDEX idx_emp ON employees (EmployeeID, DepartmentID)** (redundant for unique constraints)
27. **MID(EmployeeName, 3)** (should specify length or use SUBSTRING)
28. **EmployeeName NOT NULL** (should be IS NOT NULL)
29. **WHERE EmployeeID = NULL** (should be WHERE EmployeeID IS NULL)
30. **DEFAULT 'NULL'** (tho it is accepted, it should be DEFAULT NULL)
31. **WHERE DepartmentID = 101; ORDER BY EmployeeName;** (semicolon after WHERE clause)
32. **NO ERROR**
33. **NO ERROR**
34. **MODIFY COLUMN DepartmentID varchar(10)** (should be MODIFY DepartmentID varchar(10))
35. **ON DELETE SET DEFAULT** (should be ON DELETE CASCADE OR ON DELETE NULLIFY)
36. **AVG(Salary)** (cannot use WHERE for aggregate function)
37. **ON employees.DepartmentID == departments.DepartmentID** (should be single equals sign)
38. **NO ERROR**
39. **WHERE EmployeeName IN 'John', 'Jane', 'Jake'** (should use parentheses)
40. **CREATE INDEX idx_salary ON employees** (column not defined)