create database Ejercicios5;

use Ejercicios5;


CREATE TABLE Usuarios(
  id_User INT(45) NOT NULL,
  Nom_User VARCHAR(100) NOT NULL,
  Pass_User VARCHAR(45) NOT NULL,
  Level VARCHAR(45) NOT NULL,
  Nombre_User VARCHAR(100) NOT NULL,
  Apell_User VARCHAR(100) NOT NULL,
  Email_User VARCHAR(45) NOT NULL,
  Active VARCHAR(10) NOT NULL,
  PRIMARY KEY (id_User))
ENGINE = InnoDB;


CREATE TABLE Activations (
  Code VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  nick VARCHAR(45) NOT NULL,
  Usuarios_id_User INT(45) NOT NULL,
  PRIMARY KEY (Code, Usuarios_id_User),
  CONSTRAINT fk_Activations_Usuarios
    FOREIGN KEY (Usuarios_id_User)
    REFERENCES Usuarios (id_User)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Objetivos(
  Cod_empr VARCHAR(45) NOT NULL,
  Objgen VARCHAR(500) NOT NULL,
  Obj1 VARCHAR(500) NULL,
  Obj2 VARCHAR(500) NULL,
  Obj3 VARCHAR(500) NULL,
  Obj4 VARCHAR(500) NULL,
  PRIMARY KEY (Cod_empr))
ENGINE = InnoDB;

CREATE TABLE Empresa(
  Cod_Empr VARCHAR(45) NOT NULL,
  Nom_Empr VARCHAR(45) NULL,
  Mision_Empr VARCHAR(1000) NULL,
  Vision_Empr VARCHAR(1000) NULL,
  Nit VARCHAR(150) NULL,
  Rep_Legal VARCHAR(150) NULL,
  cam_comer VARCHAR(150) NULL,
  Telefono_1 VARCHAR(150) NULL,
  Telefono_2 VARCHAR(150) NULL,
  Direccion VARCHAR(150) NULL,
  Email VARCHAR(150) NULL,
  Website VARCHAR(150) NULL,
  Objetivos_Cod_empr VARCHAR(45) NOT NULL,
  PRIMARY KEY (Cod_Empr, Objetivos_Cod_empr),
  CONSTRAINT fk_Empresa_Objetivos1
    FOREIGN KEY (Objetivos_Cod_empr)
    REFERENCES Objetivos (Cod_empr)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Asignador_Codigo (
  Codigo VARCHAR(45) NOT NULL,
  Empresa_Cod_Empr VARCHAR(45) NOT NULL,
  PRIMARY KEY (Codigo, Empresa_Cod_Empr),
  CONSTRAINT fk_Asignador_Codigo_Empresa1
    FOREIGN KEY (Empresa_Cod_Empr)
    REFERENCES Empresa (Cod_Empr)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



