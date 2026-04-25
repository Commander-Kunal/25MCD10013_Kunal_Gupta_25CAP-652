SELECT s.sup_name, p.prod_name, o.qty
FROM Tbl_Orders o
JOIN Tbl_Products p ON o.prod_id = p.prod_id
JOIN Tbl_Suppliers s 
    ON p.category = 'Electronics' AND s.sup_id = 701
    OR p.category = 'Furniture' AND s.sup_id = 702;
