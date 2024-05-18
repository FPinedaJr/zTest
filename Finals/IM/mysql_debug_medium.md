**Debugging Quiz**

**Sample Table:**
| SaleID | ProductName | SaleDate   | Quantity | UnitPrice |
|--------|-------------|------------|----------|-----------|
| 1      | Laptop      | 2024-05-01 | 5        | 1200.00   |
| 2      | Smartphone  | 2024-05-02 | 3        | 800.00    |
| 3      | Tablet      | 2024-05-03 | 2        | 500.00    |

**Query:**

```sql
SELECT ProductName, 
       SUM(Quantity) AS TotalQuantity, 
       AVG(UnitPrice) AS AveragePrice, 
       CONCAT('Total sales of ', ProductName ' on ', SaleDate) AS SalesDescription, 
FROM Sale
WHERE SUM(Quantity > 2) AND LEN(SalesDescription) > 2
GROUP BY ProductName 
ORDER BY SaleDate DESC;
HAVING AVG(UnitPrice) > 600 
```
