### SQL Statements and Syntax

#### SELECT Statement
- Retrieves data from one or more columns:
```sql
SELECT column_name(s) 
FROM table_name;
```
- To select all columns:
```sql
SELECT * 
FROM table_name;
```

#### WHERE Clause
- Filters records that fulfill a specified condition:
```sql
SELECT column_name(s) 
FROM table_name 
WHERE column_name operator value;
```
- Example with equality operator:
```sql
SELECT * 
FROM table_name 
WHERE column_name = 'value';
```

#### AND Operator
- Combines multiple conditions, all of which must be true:
```sql
SELECT * 
FROM table 
WHERE condition1 AND condition2;
```

#### OR Operator
- Combines multiple conditions, any of which can be true:
```sql
SELECT * 
FROM table 
WHERE condition1 OR condition2;
```

#### Combining AND & OR
- Combines multiple conditions with both AND and OR:
```sql
SELECT * 
FROM table 
WHERE (condition1) AND (condition2 OR condition3);
```

#### ORDER BY Keyword
- Sorts the result set in ascending or descending order:
```sql
SELECT column_name(s) 
FROM table 
ORDER BY column_name ASC;
```
- For descending order:
```sql
SELECT column_name(s) 
FROM table 
ORDER BY column_name DESC;
```

#### INSERT INTO Statement
- Inserts new records into a table:
```sql
INSERT INTO table_name (column1, column2, column3) 
VALUES (value1, value2, value3);
```
- Without specifying columns:
```sql
INSERT INTO table_name 
VALUES (value1, value2, value3);
```

#### UPDATE Statement
- Modifies existing records in a table:
```sql
UPDATE table_name 
SET column1 = value1, column2 = value2 
WHERE condition;
```

#### DELETE Statement
- Deletes specific records:
```sql
DELETE FROM table_name 
WHERE condition;
```
- Deletes all rows:
```sql
DELETE FROM table_name;
```

#### LIKE Operator
- Searches for a specified pattern in a column:
```sql
SELECT column_name(s) 
FROM table_name 
WHERE column_name LIKE pattern;
```
- With wildcard examples:
  - Any number of characters: `%`
  - Single character: `_`
  - Example:
  ```sql
  SELECT * 
  FROM Persons 
  WHERE City LIKE 'sa%';
  ```

#### IN Operator
- Allows specifying multiple values in a WHERE clause:
```sql
SELECT column_name(s) 
FROM table_name 
WHERE column_name IN (value1, value2, ...);
```

#### BETWEEN Operator
- Filters within a certain range:
```sql
SELECT column_name(s) 
FROM table_name 
WHERE column_name BETWEEN value1 AND value2;
```

#### NOT BETWEEN Operator
- Filters outside a certain range:
```sql
SELECT column_name(s) 
FROM table_name 
WHERE column_name NOT BETWEEN value1 AND value2;
```

#### Aliases
- Creates temporary names for columns or tables:
  - Column alias:
  ```sql
  SELECT column_name AS alias_name 
  FROM table_name;
  ```
  - Table alias:
  ```sql
  SELECT column_name(s) 
  FROM table_name AS alias_name;
  ```
Sure, let's elaborate on the different types of JOIN operations using sample tables and corresponding SQL queries. We'll use two tables, `Employees` and `Departments`, and illustrate the output for each type of join.

### Sample Tables

**Employees Table:**

| EmployeeID | EmployeeName | DepartmentID |
|------------|--------------|--------------|
| 1          | John         | 101          |
| 2          | Jane         | 102          |
| 3          | Jake         | 103          |
| 4          | Judy         | NULL         |

**Departments Table:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| 101          | HR             |
| 102          | IT             |
| 104          | Marketing      |

### INNER JOIN

An INNER JOIN returns only the rows where there is a match in both tables.

```sql
SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Output:**

| EmployeeID | EmployeeName | DepartmentName |
|------------|--------------|----------------|
| 1          | John         | HR             |
| 2          | Jane         | IT             |

### LEFT JOIN

A LEFT JOIN returns all rows from the left table (Employees), and the matched rows from the right table (Departments). If there is no match, NULL values are returned for columns from the right table.

```sql
SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Output:**

| EmployeeID | EmployeeName | DepartmentName |
|------------|--------------|----------------|
| 1          | John         | HR             |
| 2          | Jane         | IT             |
| 3          | Jake         | NULL           |
| 4          | Judy         | NULL           |

### RIGHT JOIN

A RIGHT JOIN returns all rows from the right table (Departments), and the matched rows from the left table (Employees). If there is no match, NULL values are returned for columns from the left table.

```sql
SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Output:**

| EmployeeID | EmployeeName | DepartmentName |
|------------|--------------|----------------|
| 1          | John         | HR             |
| 2          | Jane         | IT             |
| NULL       | NULL         | Marketing      |

### CROSS JOIN

A CROSS JOIN returns all rows when there is a match in one of the tables. It returns NULL values for non-matching rows from either table.

```sql
SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Output:**

| EmployeeID | EmployeeName | DepartmentName |
|------------|--------------|----------------|
| 1          | John         | HR             |
| 2          | Jane         | IT             |
| 3          | Jake         | NULL           |
| 4          | Judy         | NULL           |
| NULL       | NULL         | Marketing      |

### Summary

- **INNER JOIN**: Returns only matching rows.
- **LEFT JOIN**: Returns all rows from the left table and matching rows from the right table.
- **RIGHT JOIN**: Returns all rows from the right table and matching rows from the left table.
- **CROSS JOIN**: Returns all rows when there is a match in one of the tables, including unmatched rows from both tables with NULLs for non-matching parts.

### SQL UNION Operator
- Combines the result-set of two or more SELECT statements:
```sql
SELECT column_name(s) FROM table_name1 
UNION 
SELECT column_name(s) FROM table_name2;
```

- **UNION ALL**:
  - Combines the result-set of two or more SELECT statements, including duplicate rows:
  ```sql
  SELECT column_name(s) FROM table_name1 
  UNION ALL
  SELECT column_name(s) FROM table_name2;
  ```

### SQL SELECT INTO Statement
- Copies data from one table into a new table:
```sql
SELECT column_name(s) 
INTO new_table 
FROM old_table;
```

### CREATE Statements

#### CREATE DATABASE
- Creates a new database:
```sql
CREATE DATABASE database_name;
```

#### CREATE TABLE
- Creates a new table in the database:
```sql
CREATE TABLE table_name (
    column_name1 data_type,
    column_name2 data_type,
    ...
);
```
#### SQL CREATE TABLE AS
- Creates a new table based on the result of a query:
```sql
CREATE TABLE new_table AS
SELECT column_name(s)
FROM existing_table
WHERE condition;
```


### SQL Constraints

#### NOT NULL Constraint
- Ensures that a column cannot have a NULL value:
```sql
CREATE TABLE table_name (
    column_name data_type NOT NULL
);
```

#### UNIQUE Constraint
- Ensures all values in a column are unique:
```sql
CREATE TABLE table_name (
    column_name data_type UNIQUE
);



ALTER TABLE table_name 
ADD CONSTRAINT constraint_name UNIQUE (column_name);
```
- Dropping a UNIQUE constraint:
```sql
ALTER TABLE table_name 
DROP CONSTRAINT constraint_name;
```

#### FOREIGN KEY Constraint
- Prevents actions that would destroy links between tables:
```sql
CREATE TABLE table_name (
    column_name data_type,
    FOREIGN KEY (column_name) REFERENCES other_table (column_name)
);

ALTER TABLE table_name 
ADD CONSTRAINT constraint_name FOREIGN KEY (column_name) REFERENCES other_table (column_name);
```
#### FOREIGN KEY Constraint
- Prevents actions that would destroy links between tables:
```sql
CREATE TABLE table_name (
    column_name data_type,
    FOREIGN KEY (column_name) REFERENCES other_table (column_name)
    ON DELETE CASCADE -- Deletes rows in the referencing table if rows in the referenced table are deleted
    ON DELETE SET NULL -- Sets the referencing column value to NULL if rows in the referenced table are deleted
);

ALTER TABLE table_name 
ADD CONSTRAINT constraint_name FOREIGN KEY (column_name) REFERENCES other_table (column_name);
```
- Dropping a FOREIGN KEY constraint:
```sql
ALTER TABLE table_name 
DROP FOREIGN KEY constraint_name;
```

#### CHECK Constraint
- Ensures that the values in a column satisfy a specific condition:
```sql
CREATE TABLE table_name (
    column_name data_type CHECK (condition)
);
```
- Dropping a CHECK constraint:
```sql
ALTER TABLE table_name 
DROP CONSTRAINT constraint_name;
```

#### DEFAULT Constraint
- Sets a default value for a column when no value is specified:
```sql
CREATE TABLE table_name (
    column_name data_type DEFAULT default_value
);

ALTER TABLE table_name 
ALTER COLUMN column_name DROP DEFAULT;
```

### Indexes

#### Creating Index
- Improves the speed of operations in a table:
```sql
CREATE INDEX index_name 
ON table_name (column_name);
```

#### Creating Unique Index
- Ensures that all values in a column are unique:
```sql
CREATE UNIQUE INDEX index_name 
ON table_name (column_name);
```

#### Dropping Index
- Removes an index:
```sql
DROP INDEX index_name 
ON table_name;
```

### Table and Database Operations

#### Dropping a Table
- Deletes a table and all of its data:
```sql
DROP TABLE table_name;
```

#### Dropping a Database
- Deletes a database and all of its tables:
```sql
DROP DATABASE database_name;
```

#### Truncating a Table
- Removes all rows from a table, but the structure remains:
```sql
TRUNCATE TABLE table_name;
```

#### Altering a Table
- Modifies an existing table structure:
  - Adding a column:
  ```sql
  ALTER TABLE table_name 
  ADD column_name data_type;
  ```
  - Dropping a column:
  ```sql
  ALTER TABLE table_name 
  DROP COLUMN column_name;
  ```
  - Modifying a column:
  ```sql
  ALTER TABLE table_name 
  MODIFY COLUMN column_name new_data_type;
  ```

### Auto-Increment Fields

#### MySQL Auto-increment
- Creates an auto-incrementing primary key:
```sql
CREATE TABLE table_name (
    column_name int AUTO_INCREMENT,
    PRIMARY KEY (column_name)
);
```

### SQL Views

#### Creating a View
- Creates a virtual table based on the result-set of a SELECT statement:
```sql
CREATE VIEW view_name 
AS 
SELECT column_name(s) 
FROM table_name 
WHERE condition;
```

#### Updating a View
- Modifies an existing view:
```sql
CREATE OR REPLACE VIEW view_name 
AS 
SELECT column_name(s) 
FROM table_name 
WHERE condition;
```

#### Dropping a View
- Deletes a view:
```sql
DROP VIEW view_name;
```

### SQL Dates and NULL Values

#### Date Functions
- Retrieves the current date and time or manipulates date values:
```sql
SELECT NOW();
SELECT CURDATE();
SELECT DATE_ADD(date, INTERVAL value unit);
```

#### Handling NULL Values
- Checks for NULL or NOT NULL values in a column:
```sql
SELECT * FROM table_name 
WHERE column_name IS NULL;

SELECT * FROM table_name 
WHERE column_name IS NOT NULL;
```
- Functions to handle NULL values:
```sql
SELECT ISNULL(column_name, replacement_value);
SELECT COALESCE(column_name, replacement_value);
```
- `ISNULL`: Returns `replacement_value` if `column_name` is NULL, else returns `column_name`.
- `COALESCE`: Returns the first non-NULL value from the list of arguments.

### MySQL Data Types

#### Text Data Types
- Stores text strings:
```sql
CHAR(size)
VARCHAR(size)
TINYTEXT
TEXT
```

#### Number Data Types
- Stores numerical values:
```sql
TINYINT(size)
SMALLINT(size)
MEDIUMINT(size)
INT(size)
```

#### Date/Time Data Types
- Stores date and time information:
```sql
DATE
DATETIME
TIMESTAMP
TIME
```

### Numeric Data Types

#### Integer Data Types
- Stores whole numbers:
```sql
tinyint
smallint
int
bigint
```

#### Decimal and

 Monetary Data Types
- Stores fixed-point numbers and currency values:
```sql
decimal(p,s)
smallmoney
money
```

#### Floating-Point Data Types
- Stores floating-point numbers:
```sql
float(n)
real
```

### Date and Time Data Types

#### Date and Time Ranges
- Stores various date and time formats:
```sql
datetime
datetime2
smalldatetime
```

#### Specific Time Data Types
- Stores specific date and time values:
```sql
date
time
datetimeoffset
```

### Other Data Types

#### Specialized Data Types
- Stores special types of data:
```sql
sql_variant
uniqueidentifier
xml
```

#### Cursor and Table Data Types
- For use with cursors and table variables:
```sql
cursor
table
```

### SQL Functions

#### Aggregate Functions
- Performs a calculation on a set of values and returns a single value:
```sql
AVG(column_name)
COUNT(column_name)
FIRST(column_name)
LAST(column_name)
MAX(column_name)
MIN(column_name)
SUM(column_name)
```

#### Scalar Functions
- Returns a single value, based on the input value:
```sql
UCASE(column_name)
LCASE(column_name)
MID(column_name, start[, length])
LEN(column_name)
ROUND(column_name, decimals)
NOW()
FORMAT(column_name, format)
```

### Aggregate Functions in SQL

#### FIRST() Function
- Returns the first value in a column:
```sql
SELECT FIRST(column_name) FROM table_name;
```

#### LAST() Function
- Returns the last value in a column:
```sql
SELECT LAST(column_name) FROM table_name;
```

#### MAX() Function
- Returns the maximum value in a column:
```sql
SELECT MAX(column_name) FROM table_name;
```

#### MIN() Function
- Returns the minimum value in a column:
```sql
SELECT MIN(column_name) FROM table_name;
```

#### SUM() Function
- Returns the sum of values in a column:
```sql
SELECT SUM(column_name) FROM table_name;
```

#### GROUP BY Statement
- Groups rows that have the same values in specified columns:
```sql
SELECT column_name, aggregate_function(column_name) 
FROM table_name 
WHERE condition 
GROUP BY column_name;
```

#### HAVING Clause
- Filters groups based on a specified condition:
```sql
SELECT column_name, aggregate_function(column_name) 
FROM table_name 
GROUP BY column_name 
HAVING condition;
```

### Case Conversion Functions

#### UCASE() Function
- Converts a column's values to uppercase:
```sql
SELECT UCASE(column_name) FROM table_name;
```

#### LCASE() Function
- Converts a column's values to lowercase:
```sql
SELECT LCASE(column_name) FROM table_name;
```

### SQL String Functions

#### MID() Function
- Extracts a substring from a column:
```sql
SELECT MID(column_name, start[, length]) FROM table_name;
```

#### LEN() Function
- Returns the length of a column's value:
```sql
SELECT LEN(column_name) FROM table_name;
```

### SQL Numeric Functions

#### ROUND() Function
- Rounds a numeric field to the number of decimals specified:
```sql
SELECT ROUND(column_name, decimals) FROM table_name;
```

### Date and Time Functions

#### NOW() Function
- Returns the current date and time:
```sql
SELECT NOW() FROM table_name;
```

#### FORMAT() Function
- Formats a value with a specified format:
```sql
SELECT FORMAT(column_name, format) FROM table_name;
```
