create database Ejercicio8;

use Ejercicio8;


CREATE TABLE sf_guard_group (
  id BIGINT(20) NOT NULL,
  Name VARCHAR(255) NULL,
  Description TEXT NULL,
  Created_at DATETIME NOT NULL,
  Updated_at DATETIME NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE sf_guard_user (
  id BIGINT(20) NOT NULL,
  first_name VARCHAR(255) NULL,
  last_name VARCHAR(255) NULL,
  email_address VARCHAR(255) NOT NULL,
  username VARCHAR(128) NOT NULL,
  algorithm VARCHAR(128) NOT NULL,
  salt VARCHAR(128) NULL,
  password VARCHAR(128) NULL,
  is_active TINYINT(1) NULL,
  is_super_admin TINYINT(1) NULL,
  last_login DATETIME NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE sf_guard_user_group (
  user_id BIGINT(20) NOT NULL,
  group_id BIGINT(20) NOT NULL,
  Created_at DATETIME NOT NULL,
  Updated_at DATETIME NOT NULL,
  sf_guard_group_id BIGINT(20) NOT NULL,
  sf_guard_user_id BIGINT(20) NOT NULL,
  PRIMARY KEY (user_id, group_id, sf_guard_group_id, sf_guard_user_id),
  CONSTRAINT fk_sf_guard_user_group_sf_guard_group1
    FOREIGN KEY (sf_guard_group_id)
    REFERENCES sf_guard_group (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sf_guard_user_group_sf_guard_user1
    FOREIGN KEY (sf_guard_user_id)
    REFERENCES sf_guard_user (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE sf_guard_remember_key (
  id BIGINT(20) NOT NULL,
  user_id BIGINT(20) NULL,
  remember_key VARCHAR(32) NULL,
  ip_address VARCHAR(50) NULL,
  Created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  sf_guard_user_id BIGINT(20) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_sf_guard_remember_key_sf_guard_user1
    FOREIGN KEY (sf_guard_user_id)
    REFERENCES sf_guard_user (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE sf_guard_permission (
  id BIGINT(20) NOT NULL,
  name VARCHAR(255) NULL,
  description TEXT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


CREATE TABLE sf_guard_group_permission (
  group_id BIGINT(20) NOT NULL,
  permission_id BIGINT(20) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  sf_guard_group_id BIGINT(20) NOT NULL,
  sf_guard_permission_id BIGINT(20) NOT NULL,
  PRIMARY KEY (group_id, permission_id, sf_guard_group_id, sf_guard_permission_id),
  CONSTRAINT fk_sf_guard_group_permission_sf_guard_group
    FOREIGN KEY (sf_guard_group_id)
    REFERENCES sf_guard_group (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sf_guard_group_permission_sf_guard_permission1
    FOREIGN KEY (sf_guard_permission_id)
    REFERENCES sf_guard_permission (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE sf_guard_user_permission(
  user_id BIGINT(20) NOT NULL,
  permission_id BIGINT(20) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  sf_guard_permission_id BIGINT(20) NOT NULL,
  sf_guard_user_id BIGINT(20) NOT NULL,
  PRIMARY KEY (user_id, permission_id, sf_guard_permission_id, sf_guard_user_id),
  CONSTRAINT fk_sf_guard_user_permission_sf_guard_permission1
    FOREIGN KEY (sf_guard_permission_id)
    REFERENCES sf_guard_permission (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_sf_guard_user_permission_sf_guard_user1
    FOREIGN KEY (sf_guard_user_id)
    REFERENCES sf_guard_user (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE sf_guard_forgot_password (
  id BIGINT(20) NOT NULL,
unique_key VARCHAR(255) NULL,
  expires_at DATETIME NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  sf_guard_user_id BIGINT(20) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_sf_guard_forgot_password_sf_guard_user1
    FOREIGN KEY (sf_guard_user_id)
    REFERENCES sf_guard_user(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

