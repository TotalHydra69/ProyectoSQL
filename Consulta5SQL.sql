Use muestra;

/*1.*/
Select Ucase(C.cliNombre) as Nombre, Length(C.cliNombre) as Tamaño from tblcliente C ;

/*2.*/
Select O.ordNumero, O.ordComentarios from tblorden O Where DateDiff(O.ordFechaEnvio, O.ordFechaRequerida) > 5 

/*3.*/
Select Concat(C.cliNombre," ", C.cliApellidoContacto) as Nombre_Completo from tblcliente C 

/*4.*/
Select P.prolpLineaProducto, Count(prolpLineaProducto) , AVG(P.proPrecio)   From tblproducto P

/*5.*/
Select O.* From tblorden O inner join tblcliente C on O.ordcliNumero = C.cliNumero inner join tblempleado E on C.cliNumeroRepresentante = E.empNumero Where E.empApellido = 'Hernandez';

/*6.*/
Select O.ordNumero, Sum(D.doCantidad * D.doPrecio) as Importe From tblorden O inner join tbldetalleorden D on O.ordNumero = D.doNumero Where O.ordNumero between 10163 and 10167;

/*7.*/
Select O.ordNumero,O.ordFecha,D.doCantidad,P.proNombre  From tblorden O inner join tbldetalleorden D on O.ordNumero = D.doNumero inner join tblproducto P on D.doCodigoProducto = P.proCodigo Where O.ordNumero between 10159 and 10161;

/*8.*/
Select Year(O.ordFecha),Month(O.ordFecha),Sum(D.doCantidad * D.doPrecio) as Importe From tblorden O inner join tbldetalleorden D on O.ordNumero = D.doNumero;

/*9.*/
Select O.ordNumero,C.cliPais From tblorden O inner join tblcliente C Where Year(O.ordFecha) = 2005 and Month(O.ordFecha) = 5;

/*10.*/
Select P.proNombre,P.prolpLineaProducto From tblproducto P Where P.proNombre like '%M%';

/*11.*/
Select O.ordNumero,O.ordEstado From tblorden O  Where O.ordcliNumero in (Select C.cliNumero,C.cliNombre From tblcliente C Where C.cliPais = 'Japan' );

/*12.*/
Select C.cliNumero,C.cliNombre From tblcliente C Where C.cliLimiteCredito > (Select C.cliLimiteCredito From tblcliente C Where C.cliNumero = 131);

/*13.*/
Select O.ordNumero From tblorden O inner join tblcliente C on O.ordcliNumero = C.cliNumero  Where C.cliNumeroRepresentante != (Select C.cliNumero From tblempleado E Where E.empNumero = 1504); 

/*14.*/


/*15.*/
Select E.empNumero,E.empNombre,E.empApellido From tblempleado E Where E.empNumero in (Select E.empReportaA From tblempleado E );

/*16.*/
Select P.proNombre,P.prolpLineaProducto From tblproducto P Where P.proNombre in (Select P.proNombre From tblproducto P Where P.proNombre like '%M%');

/*17.*/
Create View Vista1 as Select * From tblcliente C Where C.cliPais = 'Norway'; 
Select * From vista1

/*18.*/
Create View Vista2 as Select P.prolpLineaProducto, AVG(P.proPrecio) From tblproducto P
Select * From Vista2

/*19.*/
Create View Vista3 as Select Sum(d.doprecio*d.doCantidad) From tblDetalleOrden d inner join tblorden o on d.doNumero = o.ordNumero inner join tblCliente c on c.cliNumero = o.ordCliNumero Group by Year(o.ordFecha), c.cliNumero;
Select * From Vista3

/*20.*/
Create View Vista4 as Select p.proNombre From tblproducto p inner join tbldetalleorden d on p.proCodigo = d.doCodigoProducto inner join tblorden o on d.doNumero=o.ordNumero inner join tblcliente c on o.ordcliNumero = c.cliNumero Where c.cliCiudad='Paris';
Select * From Vista4;

/*21.*/
Create View Vista5 as Select proNombre,prolpLineaProducto,proVendedor From tblproducto Where proDisponible < (Select AVG(proDisponible) From tblproducto);
Select * From Vista5