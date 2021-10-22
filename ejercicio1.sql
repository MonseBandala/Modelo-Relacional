create database Ejercicio1;

use Ejercicio1;


create table Language(
  name VARCHAR(45) NULL,
  id INT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE employee(
  name VARCHAR(45) NULL,
  id INT NOT NULL,
  Language_id VARCHAR(45) NOT NULL,
  PRIMARY KEY (Language_id, id),
  
  CONSTRAINT fk_employee_Language1
    FOREIGN KEY (Language_id)
    REFERENCES Language(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

create table department(
  id INT NOT NULL,
  name VARCHAR(45) NULL,
  company_code VARCHAR(45) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


create table employee_department(
  id INT NOT NULL,
  employee_id1 VARCHAR(45) NOT NULL,
  department_id1 INT NOT NULL,
  PRIMARY KEY (id, employee_id1, department_id1),
  CONSTRAINT fk_employee_department_employee
    FOREIGN KEY (employee_id1)
    REFERENCES employee (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_employee_department_department1
    FOREIGN KEY (department_id1)
    REFERENCES department (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


