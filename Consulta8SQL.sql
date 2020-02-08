CREATE TABLE `RespaldoOficina` (
	`ofiNumero` VARCHAR(10) NOT NULL,
	`ofiCiudad` VARCHAR(50) NOT NULL,
	`ofiTelefono` VARCHAR(50) NOT NULL,
	`ofiDireccion1` VARCHAR(50) NOT NULL,
	`ofiDireccion2` VARCHAR(50) NULL DEFAULT NULL,
	`ofiEstado` VARCHAR(50) NULL DEFAULT NULL,
	`ofiPais` VARCHAR(50) NOT NULL,
	`ofiCodigoPostal` VARCHAR(15) NOT NULL,
	`ofiTerritorio` VARCHAR(10) NOT NULL
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

Delimiter //

Create Trigger OficinaRespaldo
Before Delete on tbloficina 
For Each Row 
Begin 
Insert Into RespaldoOficina Values(Old.ofiNumero,Old.ofiCiudad,Old.ofiTelefono,Old.ofiDireccion1,Old.ofiDireccion2,Old.ofiEstado,Old.ofiPais,Old.ofiCodigoPostal,Old.ofiTerritorio);
End //

Delimiter ;

Delete From tbloficina Where ofiNumero = 1;

Select * From RespaldoOficina

Create Table HistorialPrecios(
HpproCodigo Varchar(15),
HpprecioAnterior Decimal(15,2),
HpPrecioNuevo Decimal(15,2),
HpFecha DateTime
)
ENGINE=InnoDB
;


Delimiter //

Create Trigger PrecioHistorial
After Update on tblproducto
For Each Row
Begin
Insert Into HistorialPrecios Values(Old.proCodigo,Old.proPrecio,New.proPrecio,Now());
Call MostrarHistorial();
End //

Delimiter ;


Update tblproducto Set proPrecio = proPrecio+(proPrecio * 0.1);
Select * From tblproducto
Select * From HistorialPrecios
Truncate HistorialPrecios


Delimiter //

Create Procedure MostrarHistorial()
Begin
Select HpproCodigo From HistorialPrecios;
End //

Delimiter ;


Create Table GuardaEvento(
Mensaje Varchar(10),
FechaHora DateTime
)
ENGINE=InnoDB
;


Create Event EventoGuardar
On Schedule Every 30 Second

Starts '2018-08-16 20:31'
Ends '2018-08-16 20:35' 
On Completion Preserve
Do
Insert Into GuardaEvento Values("Prueba",Now());

Show Processlist;



Set Global event_scheduler = on;

Select * From GuardaEvento

Alter Event EventoGuardar
On Schedule Every 30 Second
Starts 




Delimiter //
Create Event EventoGuardar
On Schedule Every 30 Second
Starts '2018-08-16 20:18'
Ends '2018-08-16 20:25'
Do
Begin
Insert Into GuardaEvento Values('Prueba2',Now());
Delete From GuardaEvento Where Fecha < Now();
End //
Delimiter ;  

Select * From tbloficina