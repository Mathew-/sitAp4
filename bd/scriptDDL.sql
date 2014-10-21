SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `sobrenome` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `img` VARCHAR(45) NULL ,
  `sobre` VARCHAR(100) NULL ,
  `sexo` CHAR NULL ,
  `idade` INT(3) NOT NULL ,
  `nacionalidade` VARCHAR(45) NOT NULL ,
  `permissao` TINYINT(1)  NOT NULL ,
  PRIMARY KEY (`idUsuario`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Artigo` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Artigo` (
  `idArtigo` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL ,
  `texto` VARCHAR(500) NOT NULL ,
  `Usuario_idUsuario` INT NOT NULL ,
  `Foto_idFoto` INT NOT NULL ,
  PRIMARY KEY (`idArtigo`) ,
  INDEX `fk_Artigo_Usuario` (`Usuario_idUsuario` ASC) ,
  CONSTRAINT `fk_Artigo_Usuario`
    FOREIGN KEY (`Usuario_idUsuario` )
    REFERENCES `mydb`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Comentario` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT ,
  `comentario` VARCHAR(100) NOT NULL ,
  `Usuario_idUsuario` INT NOT NULL ,
  `Artigo_idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idComentario`) ,
  INDEX `fk_Comentario_Usuario1` (`Usuario_idUsuario` ASC) ,
  INDEX `fk_Comentario_Artigo1` (`Artigo_idArtigo` ASC) ,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario` )
    REFERENCES `mydb`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Artigo1`
    FOREIGN KEY (`Artigo_idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Foto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Foto` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Foto` (
  `idFoto` INT NOT NULL AUTO_INCREMENT ,
  `foto` VARCHAR(45) NOT NULL ,
  `Artigo_idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idFoto`) ,
  INDEX `fk_Foto_Artigo1` (`Artigo_idArtigo` ASC) ,
  CONSTRAINT `fk_Foto_Artigo1`
    FOREIGN KEY (`Artigo_idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categoria` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(100) NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria_has_Artigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categoria_has_Artigo` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Categoria_has_Artigo` (
  `Categoria_idCategoria` INT NOT NULL ,
  `Artigo_idArtigo` INT NOT NULL ,
  PRIMARY KEY (`Categoria_idCategoria`, `Artigo_idArtigo`) ,
  INDEX `fk_Categoria_has_Artigo_Artigo1` (`Artigo_idArtigo` ASC) ,
  INDEX `fk_Categoria_has_Artigo_Categoria1` (`Categoria_idCategoria` ASC) ,
  CONSTRAINT `fk_Categoria_has_Artigo_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria` )
    REFERENCES `mydb`.`Categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categoria_has_Artigo_Artigo1`
    FOREIGN KEY (`Artigo_idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
