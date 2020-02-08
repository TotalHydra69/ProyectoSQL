Use muestra;

/*Parte 1*/
Delimiter //

Create Procedure Proc1(in Numero Int, in Apellido Varchar(50), In Nombre Varchar(50), In Extension Varchar(50), In Email Varchar(50), In Codigo_Oficina Int, In Reporta Int, In Puesto Varchar(50))
Begin
Insert Into tblempleado Values(Numero,Apellido,Nombre,Extension,Email,Codigo_Oficina,Reporta,Puesto);
Select "Registro Insertado";
End //

Delimiter ; 

Call Proc1(2000,"Vergara","Ricardo","x5800","ricardo230023@gmail.com",6,1056,"President");
Select * From tblempleado


/*Parte 2*/

Delimiter //

Create Procedure Proc2(In Fecha_Inicial Date, In Fecha_Final Date)

Begin

Select O.ordNumero From tblorden O Where O.ordFechaRequerida Between Fecha_Inicial and Fecha_Final;

End //
Delimiter ;

Select * From tblorden
Call Proc2('2003-01-13','2003-02-09')

/*Parte 3*/

Delimiter //

Create Procedure Proc3(In Fecha_Inicial Date, In Fecha_Final Date, In Estado Varchar(50))

Begin 

Select O.ordNumero From tblorden O Where O.ordEstado = Estado and O.ordFechaRequerida Between Fecha_Inicial and Fecha_Final ;

End //

Delimiter ;

Select * From tblorden

Call Proc3('2003-01-13','2003-02-09','Shipped');

/*Parte 4*/

Delimiter //

Create Procedure Proc4(Out Numero_Oficina Varchar(50), Out Numero_Personas Int)

Begin 

Select F.ofiNumero From tbloficina F Where F.ofiCiudad = Numero_Oficina;
Select Count(E.empCodigoOficina) Into Numero_Personas From tblempleado E Where E.empCodigoOficina = Numero_Personas;

End //

Delimiter ;

Set @Numero_Oficina = 'Boston';
Set @Numero_Personas = 2;
Call Proc4(@Numero_Oficina,@Numero_Personas);

Select * From tbloficina 
Select * From tblempleado

/*Parte 5*/

Delimiter //

Create Procedure Proc5(Inout Variable1 Int,Inout Variable2 Int)

Begin 
 
Select Count(*) Into Variable1 From tblcliente C Where C.cliLimiteCredito between 100000 and 150000;
Select Count(*) From tblcliente Where cliLimiteCredito = 0;
End //

Delimiter ;
 
Set @Variable = 0: 
Call Proc5(@Variable1,@Variable2); 
Select @Variable1, @Variable2; 


/*Parte 6*/

Delimiter //

Create Procedure Proc6(In Apellido Varchar(50))

Begin
Declare Puesto Varchar(20); 
Select E.empPuesto Into Puesto From tblempleado E Where empApellido = Apellido;
If Puesto = 'Sales' Then
Select E.empNumero, E.empApellido, E.empNombre,E.empPuesto, "Aumento" Where
Else If Puesto = 'VP Sales' Then

End If;
End //

/*Parte 7*/

Create Procedure Proc7(In Lp Varchar(20),In Porcentaje_Aumento Int)
Begin
declare fin int default 0;
declare codigo int;
declare precio decimal(15,2);
Declare Cursor Cursor1 For 
Select proCodigo, proPrecio From tblproducto Where prolpLineaProducto = Lp;
fetch  cursor1 into
declare continue handler for not found set fin = 0;
 open cursor cursor1;
 while fin = 0 do
 update tblproducto set proPrecio = proPrecio+(proPrecio * (Porcentaje_Aumento/100));
End //

Delimiter ;

call proc7(Motorcycles,10);