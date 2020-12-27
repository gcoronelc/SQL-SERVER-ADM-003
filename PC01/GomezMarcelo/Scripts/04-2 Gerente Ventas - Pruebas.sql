-- ================================= PRUEBAS PARA GERENTE DE VENTAS=================================


/*
Es necesario iniciar sesion con sbuchanan

*/
-- Prueba SELECT (Errónea):


select * from shippers
select * from employees
select * from suppliers
select * from customers

-- Prueba SELECT (Exitosa):
select * from categories
select * from Products
select * from orders
select * from [Order Details]

--(SOLO SE PUEDE REALIZAR SELECT A PRODUCTS Y CATEGORIES)
/*==========================================================*/





-- Prueba insert (Exitosa):
INSERT INTO products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued) 
values ('ajo molido',3,2,'1caja 20sobres',30,40,0,0,0)
go
--Prueba insert (Errónea):
INSERT INTO shippers(companyname,phone) values ('transporte carnes','924346146')

--(SOLO SE PUEDE REALIZAR INSERT A PRODUCTS Y CATEGORIES)
/*==========================================================*/





-- Prueba update (Exitosa):

update Products set UnitsInStock=50
where ProductName = 'ajo molido'
go


-- Prueba update (Erronea):
update Shippers set phone = '945687456'
where companyname = 'transporte carnes'
go

--(SOLO SE PUEDE REALIZAR UPDATE A PRODUCTS Y CATEGORIES)
/*==========================================================*/

--Prueba delete (Exitosa):
delete  [Order Details]  where  OrderId = 10250


--(SOLO SE PUEDE REALIZAR DELETE A PRODUCTS, CATEGORIES, ORDERS Y ORDERS DETAILS)
/*==========================================================*/