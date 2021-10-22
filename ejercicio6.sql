create database Ejercicio6;

use Ejercicio6;


CREATE TABLE Genero (
  idGenero INT NOT NULL,
  Descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (idGenero))
ENGINE = InnoDB;


CREATE TABLE Grupo (
  idGrupo INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Formacion DATE NULL,
  Desintegracion DATE NULL,
  PRIMARY KEY (idGrupo))
ENGINE = InnoDB;

CREATE TABLE GenerosGrupos (
  Genero_idGenero INT NOT NULL,
  Grupo_idGrupo INT NOT NULL,
  PRIMARY KEY (Genero_idGenero, Grupo_idGrupo),
  CONSTRAINT fk_GenerosGrupos_Genero
    FOREIGN KEY (Genero_idGenero)
    REFERENCES Genero(idGenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_GenerosGrupos_Grupo1
    FOREIGN KEY (Grupo_idGrupo)
    REFERENCES Grupo (idGrupo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE Musico (
  idMusico INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Instrumento VARCHAR(45) NOT NULL,
  LugarNacimiento VARCHAR(45) NULL,
  FechaNacimiento DATE NULL,
  FechaMuerte DATE NULL,
  PRIMARY KEY (idMusico))
ENGINE = InnoDB;

CREATE TABLE MusicosGrupos (
  Instrumento VARCHAR(45) NOT NULL,
  FechaInicio DATE NULL,
  FechaFin DATE NULL,
  Grupo_idGrupo INT NOT NULL,
  Musico_idMusico INT NOT NULL,
  PRIMARY KEY (Grupo_idGrupo, Musico_idMusico),
  CONSTRAINT fk_MusicosGrupos_Grupo1
    FOREIGN KEY (Grupo_idGrupo)
    REFERENCES Grupo (idGrupo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_MusicosGrupos_Musico1
    FOREIGN KEY (Musico_idMusico)
    REFERENCES Musico(idMusico)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

