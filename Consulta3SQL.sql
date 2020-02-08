Create Database Encuesta

Use Encuesta

Create Table Preguntas(
id Int Primary Key Auto_Increment,
Proyecto Varchar(50)
)Engine = innoDB;

Select * From Preguntas

Create Table Abrir_Cerrar(
Status Char(1) 
)

Insert Into Abrir_Cerrar Values('A')

Select * From Abrir_Cerrar

Create Table Responder(
id Int Primary Key Auto_Increment,
Opcion Varchar(50),
FechaHora Datetime
)Engine = innoDB;


Create Table Votacion(
id Int Primary key Auto_Increment,
Opcion Varchar(50),
FechaHora DateTime
)Engine = innoDB;

Select * From Votacion
Select Count(*),Proyecto From Preguntas group by Proyecto
Select * From Preguntas 
Select * From Responder