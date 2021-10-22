create database Ejercicio7;

use Ejercicio7;

CREATE TABLE Inventario (
  idInventario INT NOT NULL,
  Realizo TEXT(30) NULL,
  PRIMARY KEY (idInventario))
ENGINE = InnoDB;

CREATE TABLE Predios (
  idPredios INT NOT NULL,
  Predio TEXT(50) NULL,
  Zona TEXT(30) NULL,
  CodigoInventario INT NULL,
  Inventario_idInventario INT NOT NULL,
  PRIMARY KEY (idPredios, Inventario_idInventario),
  CONSTRAINT fk_Predios_Inventario1
    FOREIGN KEY (Inventario_idInventario)
    REFERENCES Inventario (idInventario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Contratos(
  idContratos INT NOT NULL,
  Contrato TEXT(12) NULL,
  CodigoPredio INT NULL,
  Predios_idPredios INT NOT NULL,
  PRIMARY KEY (idContratos, Predios_idPredios),
  CONSTRAINT fk_Contratos_Predios1
    FOREIGN KEY (Predios_idPredios)
    REFERENCES Predios (idPredios)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Orden (
  idOrden INT NOT NULL,
  Anoplanta INT NULL,
  Superficie REAL NULL,
  Bloque INT NULL,
  CodigoContrato INT NULL,
  Contratos_idContratos INT NOT NULL,
  PRIMARY KEY (idOrden, Contratos_idContratos),
  CONSTRAINT fk_Orden_Contratos1
    FOREIGN KEY (Contratos_idContratos)
    REFERENCES Contratos (idContratos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Sitios (
  idSitio INT NOT NULL,
  Sitio INT NULL,
  CodigoOrden INT NULL,
  Orden_idOrden INT NOT NULL,
  PRIMARY KEY (idSitio, Orden_idOrden),
  CONSTRAINT fk_Sitios_Orden1
    FOREIGN KEY (Orden_idOrden)
    REFERENCES Orden (idOrden)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Arboles (
  idArbol INT NOT NULL,
  Fuente TEXT(10) NULL,
  Especie TEXT(20) NULL,
  Edad REAL NULL,
  NumArbol INT NULL,
  Diametro REAL NULL,
  Altura REAL NULL,
  CodigoSitio INT NULL,
  FechaPlan INT NULL,
  Sitios_idSitio INT NOT NULL,
  PRIMARY KEY (idArbol, Sitios_idSitio),
  CONSTRAINT fk_Arboles_Sitios
    FOREIGN KEY (Sitios_idSitio)
    REFERENCES Sitios (idSitio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Usuarios (
  Clave TEXT(10) NULL,
  Nombre TEXT(20) NULL,
  ApellidoP TEXT(20) NULL,
  ApellidoM TEXT(20) NULL,
  Tipo TEXT(12) NULL)
ENGINE = InnoDB;
