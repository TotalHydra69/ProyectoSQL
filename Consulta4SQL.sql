Use muestra;

Create Temporary Table Por_Mientras(
id_Numero int,
Descripcion varchar(25)
)Engine muestra= innoDB;

Insert Into Por_Mientras Values(1,"Prueba");

Select * From Por_Mientras;

select * From tbldetalleorden order by doCantidad desc limit 10;

Create Temporary Table DiezOrdenes select * From tbldetalleorden order by doCantidad desc limit 10;

select * From DiezOrdenes;

Drop Temporary Table DiezOrdenes;

Create Temporary Table tbldetalleorden(
id INT,
Dato Varchar(10)
);

Insert Into tbldetalleorden Values(1,"Temporal");

Select * From tbldetalleorden;

Drop Temporary Table tbldetalleorden;

Select * from tbldetalleorden;

Create View Diez_Ord as Select * From tbldetalleorden order by doCantidad desc Limit 10;

Select * From diez_ord;

Create View Cinco_Ord as Select * From Diez_Ord Limit 5;

Select * From Cinco_Ord;

Select * From Diez_Ord Limit 5,5;

Drop View Table cinco_ord;

Select doNumero, Sum(doCantidad) As Cant, Sum(doCantidad*doPrecio) As Total From tbldetalleorden Group By doNumero Having Cant > 100 and Total > 6000;

Select O.ordNumero as Numero_De_Orden,O.ordEstado as Estado,Sum(D.doCantidad * D.doPrecio) as Total From tblorden O inner join tbldetalleorden D on O.ordNumero = D.doNumero Group By Numero_De_Orden, Estado Having Estado = "Shipped" and Total > 1500;

Select O.ordNumero As Numero, C.cliNombre As Nombre ,D.doPrecio as Precio, AVG(D.doPrecio) As Promedio From tblorden O inner join tblcliente C on O.ordcliNumero = C.cliNumero inner join tbldetalleorden D on O.ordNumero = D.doNumero Group By O.ordNumero, C.cliNombre Having Precio > Promedio;

Select * From tblempleado Where empCodigoOficina IN (Select ofiNumero From tbloficina Where ofiPais = "USA");

Select O.ordNumero, C.cliNumero, AVG(D.doPrecio),D.doPrecio From tblorden O inner join tblcliente C on O.ordcliNumero = C.cliNumero inner join tbldetalleorden D on O.ordNumero = D.doNumero Group By O.ordNumero,C.cliNumero Having D.doPrecio > (Select AVG(D.doPrecio) From tbldetalleorden);