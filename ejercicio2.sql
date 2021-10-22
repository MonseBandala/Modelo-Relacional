create database Ejercicio2;

use Ejercicio2;

CREATE TABLE Cliente (
  id_Cliente INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Apellido VARCHAR(45) NULL,
  Direccion VARCHAR(45) NULL,
  Fecha_nac VARCHAR(45) NULL,
  Telefono VARCHAR(45) NULL,
  Email VARCHAR(45) NULL,
  PRIMARY KEY (id_Cliente))
ENGINE = InnoDB;


CREATE TABLE Modo_pago(
  Num_pago INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  otros_detalles VARCHAR(45) NULL,
  PRIMARY KEY (Num_pago))
ENGINE = InnoDB;


CREATE TABLE Factura(
  num_factura INT NOT NULL,
  id_Cliente INT NOT NULL,
  Num_pago INT NOT NULL,
  PRIMARY KEY (num_factura, id_Cliente, Num_pago),
  CONSTRAINT fk_Factura_Cliente
    FOREIGN KEY (id_Cliente)
    REFERENCES Cliente (id_Cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Factura_Modo_pago1
    FOREIGN KEY (Num_pago)
    REFERENCES Modo_pago (Num_pago)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE Categoria(
  id_Categoria INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Descricion VARCHAR(45) NULL,
  PRIMARY KEY (id_Categoria))
ENGINE = InnoDB;


CREATE TABLE Producto(
  id_Producto INT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Precio VARCHAR(45) NULL,
  Stock VARCHAR(45) NULL,
  Categoria_id_Categoria INT NOT NULL,
  PRIMARY KEY (id_Producto, Categoria_id_Categoria),
  CONSTRAINT fk_Producto_Categoria1
    FOREIGN KEY (Categoria_id_Categoria)
    REFERENCES Categoria (id_Categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Detalle(
  num_detalle INT NOT NULL,
  Cantidad VARCHAR(45) NULL,
  Precio VARCHAR(45) NULL,
  id_factura INT NOT NULL,
  Producto_id_Producto INT NOT NULL,
  PRIMARY KEY (num_detalle, id_factura, Producto_id_Producto),
  CONSTRAINT fk_Detalle_Factura1
    FOREIGN KEY (id_factura)
    REFERENCES Factura (num_factura)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Detalle_Producto1
    FOREIGN KEY (Producto_id_Producto)
    REFERENCES Producto(id_Producto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



