### Sample Tables with Data

#### Products Table



| ProductID | ProductName | CategoryID | SupplierID | UnitPrice | UnitsInStock | Discontinued | DateAdded           |
| 1         | Product A   | 1          | 1          | 10.50     | 100          | 0            | 2023-01-01 10:00:00 |
| 2         | Product B   | 2          | 2          | 15.75     | 50           | 1            | 2023-02-01 11:00:00 |
| 3         | Product C   | 1          | 3          | 25.00     | 0            | 0            | 2023-03-01 12:00:00 |
| 4         | Product D   | 3          | 2          | 5.00      | 200          | 0            | 2023-04-01 13:00:00 |
| 5         | Product E   | 2          | 1          | 30.00     | 20           | 1            | 2023-05-01 14:00:00 |

#### Categories Table
| CategoryID | CategoryName |
| 1          | Category 1   |
| 2          | Category 2   |
| 3          | Category 3   |

#### Suppliers Table
| SupplierID | SupplierName |
| 1          | Supplier A   |
| 2          | Supplier B   |
| 3          | Supplier C   |

### Complex Query with Errors

```sql
SELECT p.ProductID, p.ProductName, p.UnitPrice, c.CategoryName, s.SupplierName, p.UnitsInStock, p.DateAdded, p.Discontinued
FROM Products p
JOIN Categories c ON p.CategoryID == c.CategoryID
LEFT JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice > 20 AND (p.UnitsInStock > 0 OR p.Discontinued == 1)
ORDER BY p.DateAdded DESC, p.UnitPrice ASC
LIMIT 10
UNION ALL
SELECT ProductID, ProductName, UnitPrice, CategoryName, SupplierName, UnitsInStock, DateAdded, Discontinued
FROM Products
WHERE UnitsInStock IS NULL OR UnitPrice < 5
GROUP BY ProductID
HAVING COUNT(*) > 1
;

SELECT AVG(UnitPrice), SUM(UnitsInStock), MIN(DateAdded), MAX(DateAdded)
FROM Products p
WHERE DateAdded > '2023-01-01'
;

UPDATE Products
SET UnitPrice = UnitPrice * 1.1
WHERE UnitsInStock < 50 AND Discontinued = 0
ORDER BY ProductName
;

DELETE FROM Products
WHERE Discontinued = 2
LIMIT 5
;
```
