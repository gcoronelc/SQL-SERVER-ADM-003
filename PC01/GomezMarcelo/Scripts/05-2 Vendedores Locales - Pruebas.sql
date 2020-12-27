-- ================================= PRUEBAS PARA VENDEDORES LOCALES=================================

/* 

Es NECESARIO iniciar sesion con msuyama , rking o adodsworth

*/
/*================================*/
-- Prueba SELECT (Errónea):
select * from shippers
select * from employees
select * from suppliers
select * from categories
select * from Products

-- Prueba SELECT (Exitosa):
select * from orders
select * from [Order Details]
select * from customers
/*===============================*/



/*================================*/
-- Prueba INSERT (Errónea):
INSERT INTO products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) 
values ('ajo molido',3,2,'1caja 20sobres',30,40,0,0,0)
go
-- Prueba INSERT (Exitosa):
Insert INTO Customers(CustomerID, CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone)
values ('CATR','ROCKYS','Carlos Trujillo','dueño','av tomas marzano 1520','surquillo','lima','15038','peru','924346685')
/*================================*/



/*================================*/
-- Prueba UPDATE (Errónea):
update Products set UnitsInStock=50
where ProductName = 'ajo molido'
go
-- Prueba UPDATE (Exitosa):
update Customers set phone = '924346146' where CustomerID = 'CATR'
/*================================*/



/*================================*/
-- Prueba DELETE (Errónea):
delete  [Order Details]  where  OrderId = 10250


-- Prueba DELETE (Exitosa):
--LOS VENDEDORES LOCALES NO PUEDEN BORRAR NINGUN REGISTRO

/*================================*/