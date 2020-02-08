select AVG(proPrecio) from tblProducto

select AVG(proPrecio) from tblProducto where prolpLineaProducto = "Motorcycles"

select Avg(proPrecio), prolpLineaProducto from tblProducto group by prolpLineaProducto

select Sum(proPrecio), prolpLineaProducto from tblProducto group by prolpLineaProducto

select Count(proPrecio), prolpLineaProducto from tblProducto where prolpLineaProducto = "Motorcycles"

select count(proPrecio), prolpLineaProducto from tblProducto group by prolpLineaProducto

select Max(proPrecio), prolpLineaProducto from tblProducto group by prolpLineaProducto

select Min(proPrecio), prolpLineaProducto from tblProducto group by prolpLineaProducto

select Concat(cliNombre," ", cliApellidoContacto) as Nombre_Completo from tblcliente

select Min(Length(cliApellidoContacto))as Tamaño,cliApellidoContacto from tblcliente group by cliApellidoContacto order by Tamaño

select left(cliNombre,5) from tblCliente

select Concat(Left(cliApellidoContacto,2)," ",left(cliNombreContacto,2)) from tblCliente

select Replace(ofiPais,"USA", "Estados Unidos") from tblOficina

select substring(ofiPais,2,2) from tblOficina 

select Trim(Leading "5" from ofiDireccion1) from tblOficina

select Trim(Both "5" from ofiDireccion1) from tblOficina

select curdate(ordFecha) from tblorden

select Datediff(curdate(),ordFecha )/365 from tblorden

select date_add(ordFecha, interval 1 day) from tblorden

select date_sub(ordFecha, interval 1 day) from tblorden

select dayname(ordFecha) from tblorden

select dayofweek(ordFecha) from tblorden

select timediff(ordFechaRequerida,ordFechaEnvio)/24 from tblorden

select Date_Format(ordFecha,"%Y") from tblorden

select date_format(ordFecha,"%W,%d de %M") from tblorden

select ordComentarios from tblorden

select ifnull(ordComentarios,"Sin Comentarios") from tblorden

select * from tblempleado e inner join tblOficina  o on e.

select * from tblempleado e left join tblOficina o on e.

select count(*) from tblCliente, tblOrden where cliNumero = ordNumero

select count(*) from tblcliente C left join tblOrden o on C.cliNumero = o.ordcliNumero

select C.cliNumero,o.ordNumero from tblcliente C left join tblOrden o on C.cliNumero = o.ordcliNumero

select C.cliNumero,o.ordNumero from tblcliente C right join tblOrden o on C.cliNumero = o.ordcliNumero

select C.cliNumero,o.ordNumero from tblcliente C cross join tblOrden o 

select el.empNombre from tblempleado el left join tblempleado e2 on el.empReportaA = e2.empNumero