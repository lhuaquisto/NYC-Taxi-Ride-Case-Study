USE TestData
GO
/*===========================================
   CURSOR
=============================================*/
ALTER TABLE Product ADD list_price money
GO
DECLARE 
    @ProductName VARCHAR(MAX), 
    @list_price   DECIMAL;
GO 

DECLARE cursor_product CURSOR
FOR SELECT 
        ProductName, 
        list_price
    FROM 
        dbo.Product;
 
OPEN cursor_product;
 
FETCH NEXT FROM cursor_product INTO 
    @ProductName, 
    @list_price;
 
WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @ProductName + CAST(@list_price AS varchar);
        FETCH NEXT FROM cursor_product INTO 
            @ProductName, 
            @list_price;
    END;
 
CLOSE cursor_product;
 
DEALLOCATE cursor_product;