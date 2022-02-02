DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;

USE optica;

CREATE TABLE proveedores(
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono INT(9) NOT NULL,
fax INT(9) NOT NULL,
NIF VARCHAR(9) NOT NULL UNIQUE PRIMARY KEY
);

/* proveedores */
INSERT INTO proveedores VALUES ('Anna Hernández','Avinguda Diagonal, 3, 08019 Barcelona', '635677637', '932800303', 'M1234567A' );
INSERT INTO proveedores VALUES ('Soledad Castillo','C. Carretería, 84, 29008 Málaga', '652294700', '945879078', 'P8134584A' );
INSERT INTO proveedores VALUES ('Sergio Terés','Carrer de la Diputació, 92, 08015 Barcelona', '634881331', '989827265', 'L0984556B' );
INSERT INTO proveedores VALUES ('Alberto Martínez','Carrer de Ganduxer, 25, 08021 Barcelona', '687889314', '956983271', 'Y7889055E' );
INSERT INTO proveedores VALUES ('Macarena Olayo','Carrer d\'Aribau, 230, 240, 08006 Barcelona', '643099634', '997491289', 'Y8902655P' );
INSERT INTO proveedores VALUES ('Víctor Arribas','Carrer de Tarragona, 108, 110, 08015 Barcelona', '693763298', '906762900', 'L6405476P');

CREATE TABLE clientes(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono INT(9) NOT NULL,
email VARCHAR(100),
registrado DATE NOT NULL,
porIdCliente INT UNSIGNED, 
FOREIGN KEY (porIdCliente) REFERENCES clientes(id)
);

/* clientes */
INSERT INTO clientes (nombre, direccion, telefono, email, registrado, porIdCliente) VALUES ('Alejandro Arribas','Carrer d\'Aribau, 276, 08006 Barcelona', '674784898', 'alejandroarribas@gmail.com','2021/01/12', NULL);
INSERT INTO clientes (nombre, direccion, telefono, email, registrado, porIdCliente) VALUES ('Tomás Radós','C. de Mallorca, 146, 148, 08036 Barcelona', '687563271', 'tomásradós@gmail.com', '2020/12/09', NULL);
INSERT INTO clientes (nombre, direccion, telefono, email, registrado, porIdCliente) VALUES ('Inma Cordón','Carrer de Casp, 34, 08010 Barcelona', '609652177', 'cordón@gmail.com', '2021/01/18', 1);
INSERT INTO clientes (nombre, direccion, telefono, email, registrado, porIdCliente) VALUES ('Lara Martín','Travessera de Dalt, 4, 6, 08024 Barcelona', '676441287', 'martín@gmail.com', '2021/03/01', 3);

CREATE TABLE empleados(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

/* empleados */
INSERT INTO empleados (nombre) VALUES ('Eduardo Peña');
INSERT INTO empleados (nombre) VALUES ('Luis Velasco');
INSERT INTO empleados (nombre) VALUES ('Denisse Mayo');
INSERT INTO empleados (nombre) VALUES ('Eduardo Mottola');

CREATE TABLE marca_gafas(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
NIF_proveedor VARCHAR(9) NOT NULL,
FOREIGN KEY (NIF_proveedor) REFERENCES proveedores(NIF)
);
/* marca_gafas */
INSERT INTO marca_gafas (nombre, NIF_proveedor) VALUES ('Ray Ban', 'M1234567A');
INSERT INTO marca_gafas (nombre, NIF_proveedor) VALUES ('Carolina Herrera', 'Y8902655P');
INSERT INTO marca_gafas (nombre, NIF_proveedor) VALUES ('Fendi', 'L6405476P');
INSERT INTO marca_gafas (nombre, NIF_proveedor) VALUES ('Polaroid', 'M1234567A');
INSERT INTO marca_gafas (nombre, NIF_proveedor) VALUES ('Tous', 'L0984556B');

CREATE TABLE gafas(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_marca INT UNSIGNED NOT NULL,
graduacion_OD VARCHAR(5),
graduacion_OI VARCHAR(5),
tipoMontura ENUM('flotante', 'pasta',  'metal') NOT NULL,
colorMontura VARCHAR(100) NOT NULL,
colorCristal VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
FOREIGN KEY (id_marca) REFERENCES marca_gafas(id)
);

/* gafas */
INSERT INTO gafas (id_marca, graduacion_OD, graduacion_OI, tipoMontura, colorMontura, colorCristal, precio) VALUES (5, '-1.25', '-1.25', 'metal', 'Bronce', 'Marron', 86.70);
INSERT INTO gafas (id_marca, graduacion_OD, graduacion_OI, tipoMontura, colorMontura, colorCristal, precio) VALUES (1, '1.50', '1.25', 'pasta', 'Negro', 'normales', 101.00);
INSERT INTO gafas (id_marca, graduacion_OD, graduacion_OI, tipoMontura, colorMontura, colorCristal, precio) VALUES (1, '0', '0', 'metal', 'Dorado', 'Verde', 84.90);
INSERT INTO gafas (id_marca, graduacion_OD, graduacion_OI, tipoMontura, colorMontura, colorCristal, precio) VALUES (4, '-0.75', '-0.25', 'flotante', 'Havana', 'Gris', 55.45);
INSERT INTO gafas (id_marca, graduacion_OD, graduacion_OI, tipoMontura, colorMontura, colorCristal, precio) VALUES (2, '-0.75', '-1.25', 'flotante', 'Negro', 'normales', 89.00);
INSERT INTO gafas (id_marca, graduacion_OD, graduacion_OI, tipoMontura, colorMontura, colorCristal, precio) VALUES (4, '-1', '-1', 'pasta', 'Azul', 'Azul', 32.55);

CREATE TABLE ventas(
id_gafas INT UNSIGNED NOT NULL,
id_cliente INT UNSIGNED NOT NULL,
fecha DATE NOT NULL,
id_empleado INT UNSIGNED NOT NULL, 
PRIMARY KEY (id_gafas, id_cliente),
FOREIGN KEY (id_gafas) REFERENCES gafas(id),
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

/* ventas */

INSERT INTO ventas VALUES (1, 2,'2021/01/05', 4);
INSERT INTO ventas VALUES (4, 3,'2021/01/18', 1);
INSERT INTO ventas VALUES (6, 1,'2021/01/20', 3);