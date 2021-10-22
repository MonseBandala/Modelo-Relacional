create database Ejercicio3;

use Ejercicio3;

CREATE TABLE Seat (
  seat_number INT NOT NULL,
  seat_Position VARCHAR(45) NULL,
  PRIMARY KEY (seat_number))
ENGINE = InnoDB;


CREATE TABLE Instructor (
  Instructor_number INT NOT NULL,
  Instructor_name VARCHAR(45) NULL,
  Instructor_faculty VARCHAR(45) NULL,
  PRIMARY KEY (Instructor_number))
ENGINE = InnoDB;


CREATE TABLE Course(
  Course_name INT NOT NULL,
  Student_number VARCHAR(45) NULL,
  Instructor_Instructor_number INT NOT NULL,
  PRIMARY KEY (Course_name, Instructor_Instructor_number),
  CONSTRAINT fk_Course_Instructor1
    FOREIGN KEY (Instructor_Instructor_number)
    REFERENCES Instructor(Instructor_number)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE Student (
  Student_id INT NOT NULL,
  Student_name VARCHAR(45) NULL,
  Student_address VARCHAR(45) NULL,
  Seat_seat_number INT NOT NULL,
  Course_Course_name INT NOT NULL,
  Course_Instructor_Instructor_number INT NOT NULL,
  PRIMARY KEY (Student_id, Seat_seat_number, Course_Course_name, Course_Instructor_Instructor_number),
  CONSTRAINT fk_Student_Seat1
    FOREIGN KEY (Seat_seat_number)
    REFERENCES Seat (seat_number)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Student_Course1
    FOREIGN KEY (Course_Course_name , Course_Instructor_Instructor_number)
    REFERENCES Course (Course_name , Instructor_Instructor_number)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE Professor(
  Professor_id INT NOT NULL,
  Professor_name VARCHAR(45) NULL,
  Professor_faculty VARCHAR(45) NULL,
  PRIMARY KEY (Professor_id))
ENGINE = InnoDB;


CREATE TABLE Section (
  Section_number INT NOT NULL,
  Professor_Professor_id INT NOT NULL,
  PRIMARY KEY (Section_number, Professor_Professor_id),
  CONSTRAINT fk_Section_Professor1
    FOREIGN KEY (Professor_Professor_id)
    REFERENCES Professor (Professor_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE Class (
  num_registered VARCHAR(45) NULL,
  Class_date_time VARCHAR(45) NULL,
  Course_Course_name INT NOT NULL,
  Section_Section_number INT NOT NULL,
  PRIMARY KEY (Course_Course_name, Section_Section_number),
  CONSTRAINT fk_Class_Course1
    FOREIGN KEY (Course_Course_name)
    REFERENCES Course(Course_name)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Class_Section1
    FOREIGN KEY (Section_Section_number)
    REFERENCES Section(Section_number)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


