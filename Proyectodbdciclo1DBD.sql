create database BD_proyecto_control_pagos_colegiatura
go
use BD_proyecto_control_pagos_colegiatura
go
------------------------CREACION TABLAS----------------------------
create table maestro
(
id_maestropk varchar(50) not null,
nombre_maestro varchar(70) not null,
apellido_maestro varchar(70) not null,
);

create table seccion
(
id_seccionpk varchar(10) not null,
nombre_seccion varchar(250) not null,
id_maestrofk varchar(50) not null,
);

create table alumno
(
id_alumnopk varchar(6) not null,
nombres_alumno varchar(50) not null,
apellidos_alumno varchar(50) not null,
id_seccionfk varchar(10) not null,
estado_alumno bit not null,
direccion_alumno varchar(350),
genero varchar(9),
edad varchar(2),
correo_alumno varchar(200)
);

create table encargado
(
id_encargadopk int not null identity(1,1),
nombres_encargado varchar(50) not null,
apellidos_encargado varchar(50) not null,
correo_encargado varchar(200) not null,
id_alumnofk varchar(6) not null
);

create table cuota 
(
id_cuotapk int not null,
nombre_plazo varchar(12) not null,
precio_plazo float not null,
porcentaje_mora float not null
);

create table colegio 
(
id_colegiopk int not null,
nombre_colegio varchar(18) not null,
contacto_colegio varchar(23) not null,
slogan_colegio varchar(35) not null,
);

create table talonario
(
id_talonariopk int not null,
codigo_talonario_alumno int not null,
id_cuotafk int not null,
id_alumnofk varchar(6) not null,
id_colegiofk int not null
);

create table registro_pagos
(
id_pagopk int not null identity(1,1),
id_talonariofk int not null,
estado_colegiatura varchar(30) not null,
fecha_pago date not null
);

go
--creacion de las llaves primarias de las tablas de la base de datos
alter table alumno add constraint PK_alumno primary key (id_alumnopk);
alter table seccion add constraint PK_seccion primary key (id_seccionpk);
alter table encargado add constraint PK_encargado primary key (id_encargadopk);
alter table talonario add constraint PK_talonario primary key (id_talonariopk);
alter table cuota add constraint PK_cuota primary key (id_cuotapk);
alter table colegio add constraint PK_colegio primary key (id_colegiopk);
alter table maestro add constraint PK_maestro primary key (id_maestropk);
alter table registro_pagos add constraint PK_registro_pagos primary key (id_pagopk);

--creacion de llaves foraneas y conexion de tabla de alumno
alter table alumno add constraint FK_alumno_seccion foreign key (id_seccionfk)
references seccion(id_seccionpk);

--creacion de llaves foraneas y conexion de tabla de talonario
alter table talonario add constraint FK_talonario_alumno foreign key (id_alumnofk)
references alumno(id_alumnopk);

alter table talonario add constraint FK_talonario_cuota foreign key (id_cuotafk)
references cuota(id_cuotapk);

alter table talonario add constraint FK_talonario_colegio foreign key (id_colegiofk)
references colegio(id_colegiopk);

--creacion de llaves foraneas y conexion de tabla de encargado
alter table encargado add constraint FK_encargado_alumno foreign key (id_alumnofk)
references alumno(id_alumnopk);

--creacion de llaves foraneas y conexion de tabla de seccion
alter table seccion add constraint fk_maestro_seccion foreign key (id_maestrofk)
references maestro(id_maestropk);

--creacion de llaves foraneas y conexion de tabla de registro pagos
alter table registro_pagos add constraint fk_registro_talonario foreign key (id_talonariofk)
references talonario(id_talonariopk);

------------------------INSERTAR DATOS----------------------------
--Centro de inserciones con insert into
--Codigo para hacer insercion en la tabla "maestro" con insert into.
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00001','Oliver Moises', 'Garcia Caribes');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00002','Maricella lizeth', 'Espinal');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00003','Rene Alberto', 'Hernandez Saavedra');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00004','Jose Alexander', 'Ibarra Lopez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00005','Georgina Isela', 'Mancilla Alfaro');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00006','Sara', 'Perez de Ramos');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00007','Jose Alberto', 'Vanegas Hernandez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00008','Jose Roberto', 'Macin Tulunto');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00009','Jennifer Eneyda', 'Arce');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00010','Jimmy Stanley', 'Paz Sermenio');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00011','Jose Fernando', 'Magaña');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00012','Yesenia Del Carmen', 'Valle Valencia');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00013','José Noel', 'Bolaños Carabantes');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00014','Herber Arnoldo', 'Mestizo');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00015','Ligia', 'de Patiño');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00016','José Alfredo', 'Guzmán');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00017','Fabiola Astrid', 'Sanchez Palencio');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00018','Mauricio Josué', 'Pérez Ventura');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00019','Liliana Raquel', 'Rivera de Hernandez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00020','Wendy Elizabeth', 'Morales Hernández');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00021','Silvia Roxana', 'Ascencio de Lopez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00022','Elías Antonio', 'Flores Anaya');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00023','Nahúm', 'González');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00024','Carlos Edenilson', 'Perez Gomez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00025','Marcos', 'Perez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00026','Luz del Alba', 'Zepeda');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00027','Kriscia', 'Báchez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00028','Flor Idalma', 'Guevara');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00029','René', 'Galdámez');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00030','Karina Yamileth', 'Cerna');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00031','Agustin Alonso', 'Espino Ruiz');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00032','Katherine Alexandra', 'Marquez Padilla');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00033','Lidia Maria', 'Conde Padilla');
insert into maestro (id_maestropk, nombre_maestro, apellido_maestro) values ('M00034','Karla Lisseth', 'Sosa Menéndez');
select * from maestro;

--Codigo para hacer insercion en la tabla "seccion" con insert into.
insert into seccion values ('7A','Septimo grado seccion "A"','M00001');
insert into seccion values ('7B','Septimo grado seccion "B"','M00002');
insert into seccion values ('7C','Septimo grado seccion "C"','M00003');
insert into seccion values ('8A','Octavo grado seccion "A"','M00004');
insert into seccion values ('8B','Octavo grado seccion "B"','M00005');
insert into seccion values ('8C','Octavo grado seccion "C"','M00006');
insert into seccion values ('8D','Octavo grado seccion "D"','M00007');
insert into seccion values ('9A','Noveno grado seccion "A"','M00008');
insert into seccion values ('9B','Noveno grado seccion "B"','M00009');
insert into seccion values ('9C','Noveno grado seccion "C"','M00010');
insert into seccion values ('9D','Noveno grado seccion "D"','M00011');
insert into seccion values ('B1GA','Primer anio de bachillerato general seccion "A"','M00012');
insert into seccion values ('B1GB','Primer anio de bachillerato general seccion "B"','M00013');
insert into seccion values ('B1GC','Primer anio de bachillerato general seccion "C"','M00014');
insert into seccion values ('B1CA','Primer anio de bachillerato tecnico Contador seccion "A"','M00015');
insert into seccion values ('B1DSA','Primer anio de bachillerato tecnico en desarrollo de software seccion "A"','M00016');
insert into seccion values ('B1DSB','Primer anio de bachillerato tecnico en desarrollo de software seccion "B"','M00017');
insert into seccion values ('B1SA','Primer anio de bachillerato tecnico en salud seccion "A"','M00018');
insert into seccion values ('B1SB','Primer anio de bachillerato tecnico en salud seccion "B"','M00019');
insert into seccion values ('B1ST','Primer anio de bachillerato tecnico en servicios turisticos seccion "A"','M00020');
insert into seccion values ('B2GA','Segundo anio de bachillerato general seccion "A"','M00021');
insert into seccion values ('B2GB','Segundo anio de bachillerato general seccion "B"','M00022');
insert into seccion values ('B2BC','Segundo anio de bachillerato general seccion "C"','M00023');
insert into seccion values ('B2SA','Segundo anio de bachillerato tecnico en salud seccion "A"','M00024');
insert into seccion values ('B2SB','Segundo anio de bachillerato tecnico en salud seccion "B"','M00025');
insert into seccion values ('B2CA','Segundo anio de bachillerato tecnico Contador seccion "A"','M00026');
insert into seccion values ('B2DSA','Segundo anio de bachillerato tecnico en desarrollo de software seccion "A"','M00027');
insert into seccion values ('B2DSB','Segundo anio de bachillerato tecnico en desarrollo de software seccion "B"','M00028');
insert into seccion values ('B2ST','Segundo anio de bachillerato tecnico en servicios turisticos seccion "A"','M00029');
insert into seccion values ('B3CA','Tercer anio de bachillerato tecnico Contador seccion "A"','M00030');
insert into seccion values ('B3DSA','Tercer anio de bachillerato tecnico en desarrollo de software seccion "A"','M00031');
insert into seccion values ('B3SA','Tercer anio de bachillerato tecnico en salud seccion "A"','M00032');
insert into seccion values ('B3SB','Tercer anio de bachillerato tecnico en salud seccion "B"','M00033');
insert into seccion values ('B3ST','Tercer anio de bachillerato tecnico en servicios turisticos seccion "A"','M00034');
select * from seccion;

--Codigo para hacer insercion en la tabla "colegio" con insert into.
insert into colegio values(1834,'Colegio San Pedro', 'Col_SPedro@hotmail.com','Educando al pueblo desde 1956');
select * from colegio;

--Codigo para hacer insercion en la tabla "alumno" con insert into.
insert into alumno values(404656,'Luis Alonso','Hernandez Mundo','B3DSA',1,'Sonsonate','Masculino','18','luisalonso1@gmail.com');
insert into alumno values(472177,'Gabriela Michelle','Garcia Perez','B3SB',1,'San Salvador','Femenino','18','GabrielaP3rez@gmail.com');
insert into alumno values(810269,'Cristina Raquel','Alfaro Agilar','B2DSA',1,'San Salvador','Femenino','18','Cristina4lfaro@gmail.com');
insert into alumno values(472892,'Alison Michelle','Molina Garcia','B3ST',1,'San Salvador','Femenino','18','AlisonG4rc7a@gmail.com');
insert into alumno values(719301,'Carlos Alberto','Hernandez Guardado','B3CA',1,'Sonsonate','Masculino','18','C4rlosGu4rdado@gmail.com');
select * from alumno;

--Codigo para hacer insercion en la tabla "encargado" con insert into.
insert into encargado values('Carlos Alonso','Hernandez Funes','Carloshernandez@yahoo.com',404656);
insert into encargado values('Veirus Marisol','Alvarez Blanco','Marialvarez@gmail.com',472177);
insert into encargado values('Andrea Esperanza','Ruano Linares','Andr3alinares@gmail.com',810269);
insert into encargado values('Eligia Sarai','Castro','Saraicastro78@gmail.com',472892);
insert into encargado values('Helen Liseth','Peralta Castaneda','l7sethPeral78@gmail.com',719301);
select * from encargado;

--Codigo para hacer insercion en la tabla "cuota" con insert into.
insert into cuota values (154,'Plazo Largo',35.00,0.1);
insert into cuota values (145,'Plazo Corto',42.78,0.1);
select * from cuota;
 
 --Codigo para hacer insercion en la tabla "talonario" con insert into.
insert into talonario values (0913,25913,154,404656,1834);
insert into talonario values (0627,25627,145,472177,1834);
insert into talonario values (0928,25928,145,810269,1834);
insert into talonario values (0893,25893,154,472892,1834);
insert into talonario values (0124,25124,145,719301,1834);
select * from talonario;

 --Codigo para hacer insercion en la tabla "Cuota" con insert into.
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (124, 'pagado', '2025-01-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (627, 'pagado', '2025-01-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (893, 'pagado', '2025-01-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (913, 'pagado', '2025-01-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (928, 'pagado', '2025-01-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (627, 'pagado', '2025-02-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (893, 'pagado', '2025-02-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (913, 'pagado', '2025-02-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (124, 'pagado', '2025-02-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (627, 'pagado', '2025-03-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (893, 'pagado', '2025-03-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (913, 'pagado', '2025-03-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (124, 'pagado', '2025-04-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (627, 'pagado', '2025-04-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (124, 'pagado', '2025-05-10');
insert into registro_pagos (id_talonariofk, estado_colegiatura, fecha_pago) values (627, 'pagado', '2025-05-10');
select * from cuota;

------------------------PROCEDIMIENTOS----------------------------
--procedimientos almacenados para la tabla alumno--
--codigo para agregar
create procedure spu_insertar_alumno
@id_alumnopk varchar(6),
@nombres_alumno varchar(38),
@apellidos_alumno varchar(38),
@id_seccionfk varchar(10),
@estado_alumno int,
@direccion_alumno varchar(100),
@genero varchar(9),
@edad varchar(2),
@correo_alumno varchar(150)
as
begin
insert into alumno values (@id_alumnopk, @nombres_alumno, @apellidos_alumno, @id_seccionfk, @estado_alumno, @direccion_alumno, @genero, @edad, @correo_alumno);
end;

--procedimiento para modificar
create procedure spu_modificar_alumno
@id_alumno varchar(6),
@nombres_alumno varchar(38),
@apellidos_alumno varchar(38),
@id_seccionfk varchar(10),
@direccion_alumno varchar(100),
@genero varchar(9),
@edad varchar(2),
@correo_alumno varchar(150)
as
begin
update alumno
set
nombres_alumno = @nombres_alumno, 
apellidos_alumno = @apellidos_alumno,
id_seccionfk = @id_seccionfk,
direccion_alumno = @direccion_alumno,
genero = @genero,
edad = @edad,
correo_alumno = @correo_alumno
where id_alumnopk = @id_alumno;
end;

--codigo para eliminar alumno
create procedure spu_eliminar_alumno
@id_alumno varchar(6)
as
begin
delete from alumno
where id_alumnopk = @id_alumno;
end;

--procedimientos almacenados para la tabla maestro--
--codigo para agregar
create procedure spu_agregar_maestro
    @id_maestropk varchar(50),
    @nombre_maestro varchar(70),
    @apellido_maestro varchar(70)
as
begin
    insert into maestro (id_maestropk, nombre_maestro, apellido_maestro)
    values (@id_maestropk, @nombre_maestro, @apellido_maestro);
end;

--codigo para modificar
create procedure spu_modificar_maestro
    @id_maestropk varchar(50),
    @nombre_maestro varchar(70),
    @apellido_maestro varchar(70)
as
begin
    update maestro
    set nombre_maestro = @nombre_maestro, apellido_maestro = @apellido_maestro
    where id_maestropk = @id_maestropk;
end;

--codigo para eliminar maestro
create procedure spu_eliminar_maestro
    @id_maestropk varchar(50)
as
begin
    delete from maestro
    where id_maestropk = @id_maestropk;
end;

--procedimientos almacenados para la tabla registro pagos--
--codigo para agregar
create procedure spu_agregar_registro_pagos
	@id_talonariofk int,
    @estado_colegiatura varchar(30),
    @fecha_pago date
as
begin
    insert into registro_pagos(id_talonariofk, estado_colegiatura,fecha_pago)
    values (@id_talonariofk, @estado_colegiatura,@fecha_pago);
end;
select * from registro_pagos;

--procedimientos almacenados para la tabla encargados--
--codigo para agregar
create procedure spu_insertar_encargado
    @nombres_encargado varchar(50),
    @apellidos_encargado varchar(50),
    @correo_encargado varchar(200),
    @id_alumnofk varchar(6)
as
begin
    insert into encargado (nombres_encargado, apellidos_encargado, correo_encargado, id_alumnofk)
    values (@nombres_encargado, @apellidos_encargado, @correo_encargado, @id_alumnofk)
end

--codigo para modificar
create procedure spu_modificar_encargado
    @id_encargadopk int,
    @nombres_encargado varchar(50),
    @apellidos_encargado varchar(50),
    @correo_encargado varchar(200),
    @id_alumnofk varchar(6)
as
begin
    update encargado
    set 
        nombres_encargado = @nombres_encargado,
        apellidos_encargado = @apellidos_encargado,
        correo_encargado = @correo_encargado,
        id_alumnofk = @id_alumnofk
    where id_encargadopk = @id_encargadopk
end

--codigo para eliminar
create procedure spu_eliminar_encargado_por_correo
    @correo_encargado varchar(255)
as
begin
    -- elimina el encargado basado en el correo electrónico
    delete from encargado
    where correo_encargado = @correo_encargado;
end

--procedimientos almacenados para Sistema de Pagos en PYTHON 
-- codigo para ver 'HistorialEstudiante.py'
CREATE PROCEDURE spu_historial_pago
    @id_estudiante INT
AS
BEGIN 
    SELECT 
        a.id_alumnopk, 
        a.nombres_alumno,
        a.apellidos_alumno,
        t.id_talonariopk,
        r.estado_colegiatura,
        r.fecha_pago
    FROM registro_pagos r
    JOIN talonario t 
		ON t.id_talonariopk = r.id_talonariofk
    JOIN alumno a 
		ON a.id_alumnopk = t.id_alumnofk
    WHERE a.id_alumnopk = @id_estudiante;
END
GO

--codigo para ver 'EstadoCuenta.py'
CREATE PROCEDURE spu_estado_cuenta
    @id_estudiante INT
AS
BEGIN 
	SELECT 
		a.id_alumnopk,
		a.nombres_alumno,
		a.apellidos_alumno,
		a.correo_alumno,
		t.id_talonariopk,
		c.precio_plazo,
		-- Calcular meses pendientes suponiendo que los pagos debían iniciar en enero
		(MONTH(GETDATE()) - COUNT(r.id_pagopk)) AS MesesPendientes,
		-- Calcular monto pendiente
		((MONTH(GETDATE()) - COUNT(r.id_pagopk)) * c.precio_plazo + 
		 (MONTH(GETDATE()) - COUNT(r.id_pagopk)) * c.precio_plazo * c.porcentaje_mora) AS MontoPendiente,
		-- Fecha del último pago
		MAX(r.fecha_pago) AS UltimoMes
	FROM alumno a
	JOIN talonario t ON a.id_alumnopk = t.id_alumnofk
	JOIN cuota c ON c.id_cuotapk = t.id_cuotafk
	LEFT JOIN registro_pagos r ON t.id_talonariopk = r.id_talonariofk
	WHERE a.id_alumnopk = @id_estudiante
	GROUP BY 
		a.id_alumnopk,
		a.nombres_alumno,
		a.apellidos_alumno,
		a.correo_alumno,
		t.id_talonariopk,
		c.precio_plazo,
		c.porcentaje_mora;
END
GO

-- codigo crear factura 
CREATE PROCEDURE spu_generar_factura
	@id_talonario INT
AS
BEGIN
	SELECT 
		a.id_alumnopk, 
		a.nombres_alumno,
		a.apellidos_alumno,
		t.id_talonariopk,
		MAX(r.fecha_pago) AS UltimoMes,
		r.estado_colegiatura,
		c.nombre_plazo,
		c.precio_plazo,
		c.porcentaje_mora,
		(MONTH(GETDATE()) - COUNT(r.id_talonariofk)) AS MesesPendientes
		FROM registro_pagos r 
		JOIN talonario t 
			ON t.id_talonariopk = r.id_talonariofk
		JOIN alumno a 
			ON a.id_alumnopk = t.id_alumnofk
		JOIN cuota c 
			ON t.id_cuotafk = c.id_cuotapk
		WHERE r.id_talonariofk = @id_talonario
		GROUP BY 
			a.id_alumnopk, 
			a.nombres_alumno,
			a.apellidos_alumno,
			t.id_talonariopk,
			r.estado_colegiatura,
			c.nombre_plazo,
			c.precio_plazo,
			c.porcentaje_mora
END
GO

------------------------VISTAS----------------------------
--Vista para ver el id de las secciones con su nombre
create view vista_secciones as
	select id_seccionpk, nombre_seccion
	from seccion;

select * from vista_secciones

--Vista para ver el id del maestro con su nombre
create view vista_maestros as
	select id_maestropk, nombre_maestro, apellido_maestro
	from maestro;

select * from vista_maestros

--Vista para ver el id del estudiante, id de su talonario y su informacion de cuota
CREATE VIEW v_estudiante_cuota AS
	SELECT 
		a.id_alumnopk,
		a.nombres_alumno,
		a.apellidos_alumno,
		t.id_talonariopk,
		c.nombre_plazo,
		c.precio_plazo
	FROM alumno a
	JOIN talonario t 
		ON t.id_alumnofk = a.id_alumnopk
	JOIN cuota c 
		ON c.id_cuotapk = t.id_cuotafk;

select * from v_estudiante_cuota

--Vista para ver estudiantes pendientes de pagos 
CREATE VIEW v_estudiantes_pendientes AS
	SELECT 
		a.id_alumnopk,
		a.nombres_alumno,
        a.apellidos_alumno,
		a.correo_alumno,
		t.id_talonariopk,
		-- Calcular meses pagados segun el numero de registros de pagos
		COUNT(r.id_talonariofk) AS MesesPagados,
		-- Calcular meses pendientes suponiendo que los pagos debían iniciar en enero
		(MONTH(GETDATE()) - COUNT(r.id_talonariofk)) AS MesesPendientes
	FROM registro_pagos r
	JOIN talonario t
		ON t.id_talonariopk = r.id_talonariofk
	JOIN alumno a 
		ON a.id_alumnopk = t.id_alumnofk
	GROUP BY 
		a.id_alumnopk,
		a.nombres_alumno,
        a.apellidos_alumno,
		a.correo_alumno,
		t.id_talonariopk;

select * from v_estudiantes_pendientes

------------------------DISPARADORES----------------------------
--Disparador para desactivar el estado de los alumnos
create trigger DesactivarEstadoalumno
on alumno
after update
as
begin
    if update(estado_alumno)
        update alumno
        set estado_alumno = 0
        where estado_alumno = 1
end

update alumno set estado_alumno = 0 where estado_alumno = 1
select * from alumno;

--Disparador para activar el estado de los alumnos
create trigger ActivarEstadoUsuario
on alumno
after update
as
begin
    if update(estado_alumno)
    begin
        update alumno
        set estado_alumno = 1
        from alumno
        inner join inserted on alumno.id_alumnopk = inserted.id_alumnopk
        where alumno.estado_alumno = 0;
    end
end

select s.id_seccionpk as codigo_seccion, s.nombre_seccion as seccion,
                     a.id_alumnopk as NIE_alumno, a.nombres_alumno as nombres_alumno,
                     a.apellidos_alumno as apellidos_alumno,
                     e.correo_encargado as correo_encargado
                     from seccion s
                     join alumno a on s.id_seccionpk = a.id_seccionfk
                     join encargado e on a.id_alumnopk = e.id_alumnofk;

					 select*from seccion

update alumno set estado_alumno = 1 where estado_alumno = 0

--Consulta con left join para listar las secciones     
select s.id_seccionpk as ID_Seccion, 
       s.nombre_seccion as Nombre_Seccion, 
       a.id_alumnopk as ID_Alumno, 
       a.nombres_alumno as Nombres_Alumno, 
       a.apellidos_alumno as Apellidos_Alumno, 
       e.correo_encargado as Correo_Encargado, 
       rp.estado_colegiatura as Estado_de_Colegiatura, 
       rp.fecha_pago as Fecha_pago
from seccion s 
left join alumno a on s.id_seccionpk = a.id_seccionfk 
left join encargado e on a.id_alumnopk = e.id_alumnofk 
left join talonario t on a.id_alumnopk = t.id_alumnofk 
left join registro_pagos rp on t.id_talonariopk = rp.id_talonariofk 
where s.id_seccionpk = 34; 

select*from seccion
