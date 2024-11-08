CREATE DATABASE migrupoT2_pais; -- Crear una base de datos

USE migrupoT2_pais; -- Utilizr mi BBSS

CREATE TABLE Pais (
	id_pais int primary key not null,
    nombre varchar(20) not null,
    continente varchar(50) not null,
    poblacion int not null
); -- Creación Tabla País

CREATE TABLE Ciudad (
	id int primary key not null,
    nombre varchar(45) not null,
    id_pais int not null,
    foreign key(id_pais) references Pais(id_pais)
); -- Creación tabla Ciudad
    
CREATE TABLE Idioma(
	id int primary key not null,
    idioma varchar(50)
);

CREATE TABLE idioma_pais(
	id_idioma int not null,
    id_pais int not null,
    es_oficial tinyint,
    primary key (id_idioma,id_pais),
    foreign key (id_idioma) references Idioma(id),
    foreign key (id_pais) references Pais(id_pais)
);
describe idioma_pais; -- Describir tabla
select * from Idioma;
select * from Pais;
insert into Idioma (id,idioma) values (1,'Español');
insert into Idioma (id,idioma) values (2,'Ingles'),(3, 'Francés');

insert into Pais (id_pais,nombre,continente,poblacion)
values (1, 'México', 'América', 126000000),
(2, 'Estados Unidos', 'América', 331000000),
(3, 'Francia', 'Europa', 67000000),
(4, 'Canadá', 'América', 38000000);
-- Español es el lenguaje oficial de México
insert into idioma_pais (id_idioma,id_pais,es_oficial) values (1,1,1);
-- Ingles no es el leguaje oficial de Mexico 
insert into idioma_pais (id_idioma,id_pais,es_oficial) values (2,1,0);
-- truncate table idioma_pais; -- Eliminar todos los datos de la tabla 
-- drop tabla idioma_pais; -- Eliminar toda la tabla

insert into idioma_pais(id_idioma,id_pais,es_oficial) values(2,2,1); -- Inglés es oficial en Estados Unidos
insert into idioma_pais(id_idioma,id_pais,es_oficial) values(1,2,0); -- Español no es oficial en Estados Unidos
insert into idioma_pais(id_idioma,id_pais,es_oficial) values(3,3,1); -- Francés es oficial en Francia
insert into idioma_pais(id_idioma,id_pais,es_oficial) values(2,4,1); -- Inglés es oficial en Canadá
insert into idioma_pais(id_idioma,id_pais,es_oficial) values(3,4,1); -- Francés es oficial en Canadá

select * from idioma_pais;

-- 1. Listar todos los idiomas 
select * from Idioma;
select idioma from Idioma;
-- 2. Listar el idioma con ID 1
select * from Idioma where id=1;
select idioma  from Idioma where id=1;
-- 3. Consultar los pauses que esten en America
select nombre from Pais where continente = 'América';
select * from Pais where continente = 'América';
select nombre as NombrePais from Pais where continente = 'América';

-- SUBCONSULTAS 
-- 4. Subconsulta que encuentre los idiomas oficiales 
select idioma from Idioma where id in (select id_idioma from idioma_pais where es_oficial =1);