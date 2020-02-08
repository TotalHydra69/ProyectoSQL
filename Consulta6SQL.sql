Use Muestra;

/*Parte 1*/
Delimiter //
Create Procedure Todos_Los_Productos()
Begin
Select * From tblproducto;
End//
Delimiter ;

Call Todos_Los_Productos();

Drop Procedure Todos_Los_Productos;

/*Parte 2*/
Delimiter //
Create Procedure Todos_Los_Productos()
Begin
Declare numProd int;
Set numProd = 0;
Select Count(*) Into numProd
From tblproducto;
Select numProd;
End //
Delimiter ;

Call Todos_Los_Productos();

/*Parte 3*/
Delimiter //

Create Procedure DatosCliente(In cual Int)
Begin
Select * From tblcliente C Where C.cliNumero = cual;
End //
Delimiter ;

Call DatosCliente(103);

/*Parte 4*/
Delimiter //
Create Procedure OficinasPorPais(In Pais Varchar(50))
Begin
Select * From tbloficina F
Where F.ofiPais = Pais;
End //

Delimiter ;

Call OficinasPorPais('USA');

/*Parte 5*/
Delimiter //
Create Procedure OficinasPorPais1(In Pais Varchar(50), In Estado Varchar(5))
Begin
Select * From tbloficina F
Where F.ofiPais = Pais and F.ofiEstado = Estado;
End //

Delimiter ;

Call OficinasPorPais1('USA','CA');

/*Parte 6*/

Delimiter //

Create Procedure Suma_De_Precios(Out TotalSuma Decimal(15,2) )
Select Sum(P.proPrecio) Into TotalSuma From tblproducto P;

End //

Delimiter ;

Call Suma_De_Precios(@TotalSuma);
Select @TotalSuma ;

/*Parte 7*/

Delimiter //

Create Procedure TotalPorEstado(In CualEstado Varchar(50), Out Cuantas Int)
Begin
Select Count(*) Into Cuantas From tblorden O Where O.ordEstado = CualEstado;

End //

Delimiter ;

Call TotalPorEstado('Shipped',@Cuantas);
Select @Cuantas ;

/*Parte 8*/
Delimiter //

Create Procedure Aumento(Inout Numero Int, In Incremento Int)
Begin
Set Numero = Numero + Incremento;
End //

Delimiter ;

Set @Numero = 0;
Call Aumento(@Numero,5);
Select @Numero;

/*Parte 9*/

Delimiter //
Create Procedure NivelDelCliente(In numCli Int)
Begin
Declare Limite Decimal(15,2);
Select C.cliLimiteCredito Into Limite From tblcliente C Where C.cliNumero = numCli;
If Limite > 50000 Then 
Select "Platino";
Else
Select "Perrada";
End If;

End //

Delimiter ;

Call NivelDelCliente(103);

/*Parte 10*/

Delimiter //
Create Procedure NivelDelCliente1(In numCli Int)
Begin
Declare Limite Decimal(15,2);
Select C.cliLimiteCredito Into Limite From tblcliente C Where C.cliNumero = numCli;
If Limite > 50000 Then 
Select "Platino";
ElseIf Limite > 10000 And Limite < 50000 Then Select "Oro";
Else
Select "Perrada";
End If;

End //

Delimiter ;

Call NivelDelCliente1(103);

/*Parte 11*/

Delimiter //
Create Procedure NivelDelCliente2(In numCli Int)
Begin
Declare Limite Decimal(15,2);
Select C.cliLimiteCredito Into Limite From tblcliente C Where C.cliNumero = numCli;
Case
When Limite > 50000 Then 
Select "Platino";
When Limite > 10000 And Limite < 50000 Then Select "Oro";
Else
Select "Perrada";
End Case;

End //

Delimiter ;

Call NivelDelCliente2(103);

/*Parte 12*/

Delimiter //

Create Procedure NivelDelCliente3(In numCli Int, Out Nivel Varchar(10))
Begin
Declare Pais Varchar(50);
Select C.cliPais Into Pais From tblcliente C
Where cliNumero = numCli;
Case Pais
When "USA" Then 
Set Nivel = "Caca";
When "Canada" Then
Set Nivel =  "Ahi se va";
End Case;
End //

Delimiter ;

Call NivelDelCliente(103,@Nivel);

/*Parte 13*/

Delimiter //

Create Procedure CicloWhile()
Begin
Declare Numero Int Default 0;
Declare Texto Varchar(255) Default "";
While Numero < 10 Do
Set Texto = Concat(Texto,"X");
Set Numero = Numero + 1;
End While;
Select Texto;
End //
Delimiter ;

Call CicloWhile();

/*Parte 14*/

Delimiter //

Create Procedure CicloWhile1()
Begin
Declare Numero Int Default 0;
Declare Texto Varchar(255) Default "";
Repeat
Set Texto = Concat(Texto,"X");
Set Numero = Numero + 1;
Until Numero > 10
End Repeat;
Select Texto;
End //
Delimiter ;

Call CicloWhile1();

/*Parte 15*/

Delimiter //

Create Procedure CicloWhile2(In Valor Int)
Begin
Declare Numero Int Default 0;
Declare Texto Varchar(255) Default "";
Repeat
Set Texto = Concat(Texto,"X");
Set Numero = Numero + 1;
Until Numero > Valor
End Repeat;
Select Texto;
End //
Delimiter ;

Call CicloWhile2(6);