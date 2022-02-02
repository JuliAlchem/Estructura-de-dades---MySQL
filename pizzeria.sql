DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;

USE pizzeria;

CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(25) NOT NULL
);

/* provincias */
INSERT INTO provincias (nombre) VALUES ('Barcelona');
INSERT INTO provincias (nombre) VALUES ('Madrid');
INSERT INTO provincias (nombre) VALUES ('Valencia');
INSERT INTO provincias (nombre) VALUES ('Gerona');

CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
id_provincia INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

/* localidades */
INSERT INTO localidades (nombre, id_provincia) VALUES ('Madrid', 2);
INSERT INTO localidades (nombre, id_provincia) VALUES ('Valencia', 3);
INSERT INTO localidades (nombre, id_provincia) VALUES ('Barcelona', 1);
INSERT INTO localidades (nombre, id_provincia) VALUES ('Badalona‎', 1);
INSERT INTO localidades (nombre, id_provincia) VALUES ('Castelldefels', 1);
INSERT INTO localidades (nombre, id_provincia) VALUES ('San Cugat del Vallés‎‎', 1);
INSERT INTO localidades (nombre, id_provincia) VALUES ('Gerona‎', 4);
INSERT INTO localidades (nombre, id_provincia) VALUES ('Blanes‎', 4);
INSERT INTO localidades (nombre, id_provincia) VALUES ('Lloret de Mar‎‎', 4);

CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50),
direccion VARCHAR(50) NOT NULL,
cp VARCHAR(6),
telefono VARCHAR(9),
		id_localidad INT UNSIGNED NOT NULL,
		FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);

/* clientes */
INSERT INTO clientes (nombre, apellido1, apellido2, direccion, cp, id_localidad, telefono) 
VALUES ('Daniel', 'Hernández' , 'Martínez','Carrer de la Diputació, 92',  '08015', 3, '628452384');
INSERT INTO clientes (nombre, apellido1, apellido2, direccion, cp, id_localidad, telefono) 
VALUES ('Macarena', 'Olayo' , 'Arribas','Carrer d\'Aribau, 230',  '08006', 3,'643099634');
INSERT INTO clientes (nombre, apellido1, apellido2, direccion, cp, id_localidad, telefono) 
VALUES ('Alberto', 'Martínez' , 'Castillo','Carrer de Tarragona, 108, 110', '08015', 3,'668724367');
INSERT INTO clientes (nombre, apellido1, apellido2, direccion, cp, id_localidad, telefono) 
VALUES ('Juan', 'Saez', 'Vega', 'Carrer Mare de Déu del Remei, 8', '17005', 7,'668726356');
INSERT INTO clientes (nombre, apellido1, apellido2, direccion, cp, id_localidad, telefono) 
VALUES ('Zoe', 'Ramirez', 'Gea', 'Av. de Andalucía, 7', '28041', 1,'989827265');
INSERT INTO clientes (nombre, apellido1, apellido2, direccion, cp, id_localidad, telefono) 
VALUES ('Sonia', 'Gea', 'Ruiz', 'Rambla Josep Tarradellas, 8', '08860', 5, '932800303');
INSERT INTO clientes (nombre, apellido1, apellido2, direccion, cp, id_localidad, telefono) 
VALUES ('Daniel', 'Herman', 'Pacocha', 'Carrer de Santa Bàrbara, 64', '08912', 4,'626652498');



CREATE TABLE categorias(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

/* categorias */
INSERT INTO categorias (nombre) VALUES ('Clasica');
INSERT INTO categorias (nombre) VALUES ('Favoritas');
INSERT INTO categorias (nombre) VALUES ('Veggie');


CREATE TABLE productos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tipo ENUM('pizza', 'hamburguesa', 'bebida') NOT NULL,
nombre VARCHAR(45) NOT NULL,
descripcion VARCHAR(500),
imagen VARCHAR(500) NOT NULL,
precio DOUBLE NOT NULL,
id_categoria INT UNSIGNED,
FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

/* productos */
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('bebida', 'Coca Cola', 'Sabor Original Botella 50 Cl.', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/3199161144', '1.65', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('bebida', 'Coca Cola', 'Sin Cafeína Lata 33 Cl.', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/3199161150', '1.00', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('bebida', 'Agua Mineral Evian', 'Natural Botella 75 Cl.', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/3199161092', '1.95', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('bebida', 'Cerveza Desperados', 'Botella 33 Cl.', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/3199161095', '1.99', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('bebida', 'Cerveza Corona', ' Botella 3.55 Cl.', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/3199161219', '1.99', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('bebida', 'Cerveza Estrella Damm', 'Lata 33 Cl.', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/3199161233', '0.95', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('hamburguesa', 'CLASICA', 'INGREDIENTES:200 gr.de ternera Cebolla fresca, Tomate, Cogollos, Mayonesa casera', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/2356973012', '9.60', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('hamburguesa', 'GRAN VEGANO', 'INGREDIENTES:Cebolla fresca, Tomate, Cogollos, Aguacate, Burger de garbanzos, maíz dulce, espinaca baby y pimiento rojo, Chutney picante', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/2356973037', '10.60', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('hamburguesa', 'POLLO LA CRÈME', 'INGREDIENTES: Cebolla caramelizada, Sour cream, Tomate, Cogollos, Cebolla, Mayonesa casera, Pechuga de pollo marinada', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/2356973047', '11.65', NULL);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('pizza', 'Napoli', 'Tomate, mozzarella, anchoas, alcaparras, olivas negras, orégano, aceite de oliva y albahaca', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/ye6mdnrkl2wjykodphwh', '9.95', 2);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('pizza', 'Margherita', 'Tomate, mozzarella, aceite de oliva, albahaca y parmesano', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/n94rkfse7yl8ba6bpkod', '6.90', 1);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('pizza', 'Vegetariana', 'Tomate, mozzarella, olivas negras, champiñones, tomate cherry, cebolla roja, aceite de oliva virgen extra y albahaca', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/zcopsuk0fopu8ctmktys', '10.90', 3);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('pizza', 'Quattro Formaggi', 'Mozzarella, ricotta, gorgonzola, pecorino, aceite de oliva virgen extra y albahaca', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/wpn9e6wrltj1eddhqctw', '11.90', 2);
INSERT INTO productos (tipo, nombre, descripcion, imagen, precio, id_categoria) 
VALUES ('pizza', 'Diavola', 'Tomate, mozzarella, salame, cebolla roja, peperoncino y aceite de oliva virgen extra', 'https://res.cloudinary.com/glovoapp/w_600,f_auto,q_auto/Products/rqwijxsfckxq5yx1lqyu', '10.90', 1);



CREATE TABLE tiendas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
direccion VARCHAR(50) NOT NULL,
cp VARCHAR(6),
		id_localidad INT UNSIGNED NOT NULL,
        FOREIGN KEY (id_localidad) REFERENCES localidades(id)
        
);

/* tiendas */
INSERT INTO tiendas (direccion, cp, id_localidad) 
VALUES ('C. Condesa Vega del Pozo, 17', '28032',  1);
INSERT INTO tiendas (direccion, cp, id_localidad) 
VALUES ('Via Augusta, 160', '08006', 3);
INSERT INTO tiendas (direccion, cp, id_localidad) 
VALUES ('Carrer Migdia, 93, Bajo', '17003', 7);

CREATE TABLE empleados (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50),
nif VARCHAR(9) NOT NULL UNIQUE,
telefono INT(9) NOT NULL,
tipo ENUM('cocinero', 'repartidor') NOT NULL,
id_tienda INT UNSIGNED NOT NULL,
FOREIGN KEY (id_tienda) REFERENCES tiendas(id)
);

/* empleados */

INSERT INTO empleados (nombre, apellido1, apellido2, nif, telefono, tipo, id_tienda) 
VALUES ('Eduardo', 'Arribas', 'Mottola','L0984556B','635677637', 'repartidor', 2); 
INSERT INTO empleados (nombre, apellido1, apellido2, nif, telefono, tipo, id_tienda) 
VALUES ('Denisse', 'Terés', 'Mayo', 'Y7889055E', '652294700', 'cocinero', 2);
INSERT INTO empleados (nombre, apellido1, apellido2, nif, telefono, tipo, id_tienda) 
VALUES ('Luis', 'Martínez', 'Velasco', 'Y8902655P','643099634', 'repartidor', 3);
INSERT INTO empleados (nombre, apellido1, apellido2, nif, telefono, tipo, id_tienda) 
VALUES ('Eduardo', 'Terés', 'Peña', 'L6405476P', '693763298', 'repartidor', 1);


CREATE TABLE pedidos(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tipoRecogida ENUM('domicilio', 'tienda') NOT NULL,
fechaHora DATETIME NOT NULL,
id_cliente INT UNSIGNED NOT NULL,

        -- totalProducto INT NOT NULL,
		/*
        SELECT d.id_pedido, SUM(d.productoCantidad) AS TotalProducto FROM demanda d
		GROUP BY d.id_pedido;
        */
        
        -- totalPrecio DOUBLE NOT NULL
        /*
        SELECT id_pedido, SUM(p.precio) FROM demanda d
		JOIN productos p 
		ON d.id_producto = p.id
		GROUP BY id_pedido;
        */
        
		FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);




/* pedidos */
-- DATETIME FORMAT YYYY-MM-DD HH:MI:SS
INSERT INTO pedidos(tipoRecogida, fechaHora, id_cliente) 
VALUES ('domicilio','2021-08-17 17:15:45', 2);
INSERT INTO pedidos(tipoRecogida, fechaHora, id_cliente) 
VALUES ('tienda','2021-08-17 21:05:33', 7);
INSERT INTO pedidos(tipoRecogida, fechaHora, id_cliente) 
VALUES ('domicilio','2021-08-21 20:33:15', 3);
INSERT INTO pedidos(tipoRecogida, fechaHora, id_cliente) 
VALUES ('tienda','2021-09-01 11:10:00', 5);



CREATE TABLE demanda(
id_pedido INT UNSIGNED NOT NULL,
id_producto INT UNSIGNED NOT NULL,
productoCantidad INT UNSIGNED,
FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

/* demanda */
INSERT INTO demanda VALUES (1,1,1);
INSERT INTO demanda VALUES (1,7,1);
INSERT INTO demanda VALUES (1,8,1);
INSERT INTO demanda VALUES (2,11,1);
INSERT INTO demanda VALUES (2,7,1);
INSERT INTO demanda VALUES (2,4,1);
INSERT INTO demanda VALUES (3,1,1);
INSERT INTO demanda VALUES (3,4,2);
INSERT INTO demanda VALUES (3,10,1);
INSERT INTO demanda VALUES (4,8,1);
INSERT INTO demanda VALUES (4,9,1);
INSERT INTO demanda VALUES (4,13,1);
INSERT INTO demanda VALUES (4,14,1);
INSERT INTO demanda VALUES (4,5,2);


CREATE TABLE entregas(
id_pedido INT UNSIGNED NOT NULL,
id_repartidor INT UNSIGNED NOT NULL,
fechaHora DATETIME NOT NULL,
FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
FOREIGN KEY (id_repartidor) REFERENCES empleados(id)
);

/* entregas */
INSERT INTO entregas VALUES (1, 3, '2021-08-17 17:45:45');
INSERT INTO entregas VALUES (3, 4, '2021-08-21 20:55:48');

	-- totalProducto query
	SELECT d.id_pedido, SUM(d.productoCantidad) AS TotalProducto 
	FROM demanda d
	GROUP BY d.id_pedido;
	
    -- totalPrecio query
    SELECT d.id_pedido, TRUNCATE (SUM(p.precio*d.productoCantidad), 2) AS totalPrecio  FROM demanda d
	JOIN productos p
	ON d.id_producto = p.id
	GROUP BY id_pedido;