CREATE DATABASE migrupoT2; -- Crear una base de datos

USE migrupoT2; -- Utilizar mi BBDD

CREATE TABLE Libros(
	id_libros INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    autores VARCHAR(255) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    ISBN INT NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    fecha_publicacion INT NOT NULL,
    stock INT NOT NULL
    );

CREATE TABLE Autores(
	id_autores  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    nacionalidad VARCHAR(255) NOT NULL,
    fecha_nacimiento VARCHAR(255) NOT NULL,
    FOREIGN KEY(id_libros) REFERENCES Libros(id_libros)
	);
CREATE TABLE Pedidos(
	id_pedidos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estado_pedido VARCHAR(255) NOT NULL,
    fecha_compra INT NOT NULL,
    cantidad_stock INT NOT NULL
    );
CREATE TABLE clientes(
	id_clientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono INT NOT NULL,
    correo_electronico VARCHAR(500) NOT NULL
    );
CREATE TABLE Transacciones(
	id_transiccion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_transaccion INT NOT NULL,
    metodo_de_pago VARCHAR(255) NOT NULL,
    monto_total INT NOT NULL
    );
DESCRIBE Libros;
DESCRIBE Transacciones;
    
    