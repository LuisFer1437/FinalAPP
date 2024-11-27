-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bdProyectoApp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdProyectoApp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdProyectoApp` DEFAULT CHARACTER SET utf8 ;
USE `bdProyectoApp` ;

-- -----------------------------------------------------
-- Table `bdProyectoApp`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdProyectoApp`.`medicos` (
  `idMedico` INT NOT NULL AUTO_INCREMENT,
  `nombreMedico` VARCHAR(80) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `edadMedico` INT NOT NULL,
  `generoMedico` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdProyectoApp`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdProyectoApp`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `usuarioNombre` VARCHAR(80) NOT NULL,
  `usuarioCorreo` VARCHAR(80) NOT NULL,
  `usuarioDNI` INT NOT NULL,
  `usuarioContraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdProyectoApp`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdProyectoApp`.`cita` (
  `idcita` INT NOT NULL AUTO_INCREMENT,
  `citafecha` VARCHAR(40) NOT NULL,
  `citaHora` VARCHAR(45) NOT NULL,
  `nombreMedico` VARCHAR(80) NOT NULL,
  `medicos_idMedico` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idcita`),
  INDEX `fk_cita_medicos_idx` (`medicos_idMedico` ASC),
  INDEX `fk_cita_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_cita_medicos`
    FOREIGN KEY (`medicos_idMedico`)
    REFERENCES `bdProyectoApp`.`medicos` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cita_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `bdProyectoApp`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
