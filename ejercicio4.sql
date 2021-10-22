create database Ejercicio5;

use Ejercicio5;

CREATE TABLE Clientes(
  dni VARCHAR(10) NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  CodigoPostal INT NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  TelefonoFijo VARCHAR(45) NULL,
  TelefonoCelular VARCHAR(45) NULL,
  Correo VARCHAR(100) NULL,
  PRIMARY KEY (dni))
ENGINE = InnoDB;

CREATE TABLE Productos (
  idProductos INT NOT NULL,
  Marca VARCHAR(45) NOT NULL,
  Talle VARCHAR(45) NOT NULL,
  Precio DOUBLE NOT NULL,
  Stock INT NOT NULL,
  PRIMARY KEY (idProductos))
ENGINE = InnoDB;


CREATE TABLE Ventas (
  idVenta INT NOT NULL,
  Fecha DATETIME NOT NULL,
  Monto DOUBLE NOT NULL,
  FormaPago VARCHAR(45) NOT NULL,
  Clientes_dni VARCHAR(10) NOT NULL,
  Productos_idProductos INT NOT NULL,
  PRIMARY KEY (idVenta),
  CONSTRAINT fk_Ventas_Clientes1
    FOREIGN KEY (Clientes_dni)
    REFERENCES Clientes (dni)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Ventas_Productos1
    FOREIGN KEY (Productos_idProductos)
    REFERENCES Productos (idProductos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE Proveedores (
  idProveedor INT NOT NULL,
  nroPuesto INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  CodigoPostal INT NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  TelefonoFijo VARCHAR(45) NULL,
  TelefonoCelular VARCHAR(45) NULL,
  Correo VARCHAR(100) NULL,
  PRIMARY KEY (idProveedor))
ENGINE = InnoDB;

CREATE TABLE CodigosPostales (
  Localidad VARCHAR(45) NOT NULL,
  CodigoPostal INT NOT NULL,
  Clientes_dni VARCHAR(10) NOT NULL,
  CONSTRAINT fk_CodigosPostales_Proveedores1
    FOREIGN KEY (CodigoPostal)
    REFERENCES Proveedores (idProveedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CodigosPostales_Clientes1
    FOREIGN KEY (Clientes_dni)
    REFERENCES Clientes (dni)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

