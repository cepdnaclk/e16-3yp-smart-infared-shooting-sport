-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `email` VARCHAR(100) NULL COMMENT '',
  `password` VARCHAR(45) NULL COMMENT '',
  `Screenname` VARCHAR(45) NULL COMMENT '',
  `No_of_matches` INT NULL COMMENT '',
  `kills` INT NULL COMMENT '',
  `deaths` INT NULL COMMENT '',
  `wins` INT NULL COMMENT '',
  `rank` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idUser`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Match` (
  `idMatch` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `mode` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idMatch`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Play`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Play` (
  `Match_idMatch` INT NOT NULL COMMENT '',
  `User_idUser` INT NOT NULL COMMENT '',
  `noofplayers` INT NULL COMMENT '',
  `team` VARCHAR(45) NULL COMMENT '',
  `health` INT NULL COMMENT '',
  `status` TINYINT(1) NULL COMMENT '',
  `killspermatch` INT NULL COMMENT '',
  `deaths` INT NULL COMMENT '',
  `ammocount` INT NULL COMMENT '',
  PRIMARY KEY (`Match_idMatch`, `User_idUser`)  COMMENT '',
  INDEX `fk_Match_has_User_User1_idx` (`User_idUser` ASC)  COMMENT '',
  INDEX `fk_Match_has_User_Match_idx` (`Match_idMatch` ASC)  COMMENT '',
  CONSTRAINT `fk_Match_has_User_Match`
    FOREIGN KEY (`Match_idMatch`)
    REFERENCES `mydb`.`Match` (`idMatch`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Match_has_User_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
