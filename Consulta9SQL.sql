/*Parte 1*/

Delimiter //
create procedure pa_Uno(in Uid int, Unombre varchar(50), Ulogin varchar(50), Upass varchar(50), Ucorreo varchar(50), Utelefono varchar(50))
begin
insert into usuarios values (Uid,Unombre,Ulogin,Upass,Ucorreo,Utelefono);
select "Registro Insertado";
end //
Delimiter ;

call pa_Uno(19,"César Díaz Gómez","CDG","@191198@","donovandigo23@hotmail.com","5536605627");

drop procedure pa_Uno;
select * from usuarios;

/*Parte 2*/
Delimiter //
create procedure pa_Dos(in Did int, Dtitulo_p varchar(100), Dtitulo_s varchar(100), Didioma varchar(20), Dtipo varchar(20), Druta varchar(100), Ddescripcion text, Dpalabras_clave varchar(300), DPrecio varchar(20) , DidEditorial int(11))
begin
if DPrecio < 100 then
set DPrecio = 100;
insert into documento values (Did, Dtitulo_p, Dtitulo_s, Didioma, Dtipo, Druta, Ddescripcion, Dpalabras_clave, DPrecio, DidEditorial);
else
insert into documento values (Did, Dtitulo_p, Dtitulo_s, Didioma, Dtipo, Druta, Ddescripcion, Dpalabras_clave, DPrecio, DidEditorial);
end if;
select "Registro Insertado";
end //
Delimiter ;

call pa_Dos(20,"iOS Courses","Develop 20 Apps","English","Libro","foto.jpg","Es el libro para principiantes de php en el podras encontar ejemplos practicos como fuerte documentación","Programacion, Formularios, Apps, iOS","$20", 1);

drop procedure pa_Dos;
select * from documento;


/*Parte 3*/
Delimiter //
create procedure pa_Tres(Did int)
begin
update documento set idioma = "English" where id = Did;

select "Registro Actualizado";
end //
Delimiter ;

call pa_Tres(8);

drop procedure pa_Tres;
select * from documento;


/*Parte 4*/
Delimiter //
create procedure pa_Cuatro(in Dpalabras_clave varchar(300))
begin
select titulo_p, titulo_s from documento where palabras_clave Like Concat("%",Palabra,"%");
select documento;
end //
Delimiter ;

call pa_Cuatro("Formularios");

drop procedure pa_Cuatro;
select * from documento;

/*Parte 5*/
Delimiter //
create trigger dis_Uno
After update on usuarios for each row
begin
select * from usuarios;
select * from usuarios;
end //
Delimiter ;
drop trigger dis_Uno;

select * from usuarios;
update usuarios set pass = "@1911@" where id = 19;


/*Parte 6 Parte 1*/
Delimiter //
create trigger dis_Dos
before insert on documento for each row
begin
select count(*) from documento;
end //
Delimiter ;
drop trigger dis_Dos;


/*Parte 6 Parte 2*/
insert into documento values(22, 'Metodo Relajación China', 'Relajación China', 'Español', 'Diagrama', '1910168_10152179671336879_4411991258.jpg', 'Imagen que representa un metodo de relajacion china, la cual nos sirve para equilibrar nuestra mente y cuerpo, en caso de tener ira, preocupación, temor etc..', 'Relajación, Mano, Dedos, Ira, Temor','$200', 1);

/*Parte 6 Parte 3*/
Delimiter //
create trigger dis_Dos2
after insert on documento for each row
begin
select count(*) from documento;
end //
Delimiter ;
drop trigger dis_Dos2;
