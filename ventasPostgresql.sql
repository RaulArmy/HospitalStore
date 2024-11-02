CREATE TABLE table_cliente (
  idCliente int NOT NULL,
  Nombre_Cliente varchar(45) NOT NULL,
  Apellido_Cliente varchar(45) NOT NULL,
  Cedula_Cliente decimal(10,0) NOT NULL,
  PRIMARY KEY (idCliente)
);

CREATE TABLE table_vendedor (
  idVendedor int NOT NULL,
  nombreVendedor varchar(55) NOT NULL,
  PRIMARY KEY (idVendedor)
);


CREATE TABLE table_facturas (
  No_Facturas int NOT NULL,
  cliente int NOT NULL,
  fecha date NOT NULL,
  vendedor int NOT NULL,
  totals int NOT NULL,
  
  FOREIGN KEY (cliente) REFERENCES table_cliente (idCliente),
  FOREIGN KEY (vendedor) REFERENCES table_vendedor (idVendedor),
  PRIMARY KEY (No_Facturas)

);
CREATE INDEX cliente_1 ON table_facturas (cliente);
CREATE INDEX vendedor_1 ON table_facturas (vendedor);



CREATE TABLE table_productos (
  idProductos varchar(45) NOT NULL,
  nombreProductos varchar(45) NOT NULL,
  preciosProductos int NOT NULL,
  PRIMARY KEY (idProductos)
);


CREATE TABLE table_ventas (
  idVentas int NOT NULL,
  No_Facturas int NOT NULL,
  Productos varchar(45) NOT NULL,
  cantidad int NOT NULL,
  importe int NOT NULL,
  
  FOREIGN KEY (No_Facturas) REFERENCES table_facturas (No_Facturas),
  FOREIGN KEY (Productos) REFERENCES table_productos (idProductos),
  PRIMARY KEY (idVentas)

);
CREATE INDEX nrofacturas_1 ON table_ventas (No_Facturas);
CREATE INDEX productos_1 ON table_ventas (Productos);



insert  into table_productos(idProductos,nombreProductos,preciosProductos) values ('1','Impresora Laser',800),('2','Equipo medición Oxigeno',1000),('3','Tensiometro',340),('4','Rayos x',2000),('6','Linterna',12);
insert  into table_vendedor(idVendedor,nombreVendedor) values (1,'Romero Luis'),(2,'Maria Perez'),(3,'Maria Luisa Elsa');
insert  into table_cliente(idCliente,Nombre_Cliente,Apellido_Cliente,Cedula_Cliente) values (1,'Jorge','Mendoza','2367'),(2,'Lorena','Palco','7892'),(3,'Lopez','Martinez','4571'),(4,'Rosa','Palacios','1489');


ALTER TABLE table_productos ADD CONSTRAINT unique_producto2 UNIQUE ( idProductos );
ALTER TABLE table_vendedor ADD CONSTRAINT unique_vendedor2 UNIQUE ( idVendedor );
ALTER TABLE table_cliente ADD CONSTRAINT unique_cliente2 UNIQUE ( idCliente );
ALTER TABLE table_ventas ADD CONSTRAINT unique_ventas2 UNIQUE ( idVentas, No_Facturas, Productos );
ALTER TABLE table_facturas ADD CONSTRAINT unique_facturas UNIQUE ( No_Facturas, vendedor, cliente );

select * from table_cliente;