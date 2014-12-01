-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.27
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `sitap`
--
CREATE DATABASE `sitap` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sitap`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigo`
--

CREATE TABLE IF NOT EXISTS `artigo` (
  `idartigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `corpo` text,
  `data` datetime DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `like` int(11) DEFAULT NULL COMMENT 'Quantidade de curtidas que o artigo recebe.',
  PRIMARY KEY (`idartigo`),
  KEY `fk_artigo_usuario1` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `artigo`
--

INSERT INTO `artigo` (`idartigo`, `titulo`, `corpo`, `data`, `idusuario`, `like`) VALUES
(1, 'A Pizza nossa de cada dia no dai hoje', '<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>', '2014-10-27 16:42:13', 2, 15),
(2, 'O bacon faz mal pro porco', '<p>Bacon ipsum dolor amet pork loin rump sausage kielbasa shank doner kevin spare ribs sirloin pork chop tenderloin corned beef ham hock tongue meatloaf. Corned beef cow brisket rump jerky t-bone. Ribeye brisket jowl, tri-tip frankfurter cow short ribs shank pork spare ribs venison flank ham salami. Boudin t-bone kielbasa flank strip steak.</p>', '2014-10-27 16:50:35', 3, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nome`, `descricao`) VALUES
(1, 'Pizza', 'Categora que fala sobre pizzas'),
(2, 'Bacon', 'Categoria sobre bacon');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_has_artigo`
--

CREATE TABLE IF NOT EXISTS `categoria_has_artigo` (
  `idcategoria` int(11) NOT NULL,
  `idartigo` int(11) NOT NULL,
  PRIMARY KEY (`idcategoria`,`idartigo`),
  KEY `fk_categoria_has_artigo_artigo1` (`idartigo`),
  KEY `fk_categoria_has_artigo_categoria1` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria_has_artigo`
--

INSERT INTO `categoria_has_artigo` (`idcategoria`, `idartigo`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idartigo` int(11) NOT NULL,
  `corpo` varchar(45) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_usuario_has_artigo_artigo1` (`idartigo`),
  KEY `fk_usuario_has_artigo_usuario` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `comentario`
--

INSERT INTO `comentario` (`idcomentario`, `idusuario`, `idartigo`, `corpo`, `data`) VALUES
(2, 3, 1, 'Alo ha Cacilda aqui', '2014-10-28 08:56:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `idfoto` int(11) NOT NULL AUTO_INCREMENT,
  `arquivo` varchar(45) DEFAULT NULL,
  `idartigo` int(11) NOT NULL,
  PRIMARY KEY (`idfoto`),
  KEY `fk_foto_artigo1` (`idartigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `foto`
--

INSERT INTO `foto` (`idfoto`, `arquivo`, `idartigo`) VALUES
(1, 'http://lorempizza.com/i/714/300', 1),
(2, 'http://lorempizza.com/i/514/300', 1),
(3, 'http://baconmockup.com/300/200', 2),
(4, 'http://baconmockup.com/714/300', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `email`, `senha`, `sexo`, `cidade`, `estado`, `endereco`, `cep`, `foto`) VALUES
(1, 'Admin', 'admin@admin.com.br', '1234', NULL, NULL, NULL, NULL, NULL, 'ciclops.png'),
(2, 'Gilberson Silva dos Santos', 'gilber@hotmail.com', '1234', 'M', 'Brusque', 'SC', 'Rua do Gilberson, 47', '88356-890', 'gilberson.png'),
(3, 'Cacilda Paris Hilton', 'cacilda@gmail.com', '1234', 'F', 'Guabiruba', 'SC', 'Rua na Guabiruba, 74', '88301-805', 'cacilda.png');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `artigo`
--
ALTER TABLE `artigo`
  ADD CONSTRAINT `artigo_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `categoria_has_artigo`
--
ALTER TABLE `categoria_has_artigo`
  ADD CONSTRAINT `categoria_has_artigo_ibfk_2` FOREIGN KEY (`idartigo`) REFERENCES `artigo` (`idartigo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `categoria_has_artigo_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`idartigo`) REFERENCES `artigo` (`idartigo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`idartigo`) REFERENCES `artigo` (`idartigo`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
