-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.44-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema psi
--

CREATE DATABASE IF NOT EXISTS psi;
USE psi;

--
-- Definition of table `capitulo`
--

DROP TABLE IF EXISTS `capitulo`;
CREATE TABLE `capitulo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `capitulo`
--

/*!40000 ALTER TABLE `capitulo` DISABLE KEYS */;
INSERT INTO `capitulo` (`Id`,`Nome`,`Descricao`) VALUES 
 (1,'Calculo','Relacionado com problemas aritméticos'),
 (2,'Condicional','Relacionado com problemas que é necessário haver condições'),
 (3,'Decisao','Problemas de algoritmos se /escolhe'),
 (4,'Repetição','Problemas de algoritmos faz / enquanto / para / repete'),
 (5,'Arrays','Conjunto de dados todos do mesmo tipo que podem ser acedidos através de um índice');
/*!40000 ALTER TABLE `capitulo` ENABLE KEYS */;


--
-- Definition of table `perguntas`
--

DROP TABLE IF EXISTS `perguntas`;
CREATE TABLE `perguntas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pergunta` varchar(255) NOT NULL,
  `Dificuldade` int(1) NOT NULL,
  `Lingua` varchar(255) NOT NULL,
  `CapituloId` int(10) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `perguntas_capitulo` (`CapituloId`),
  CONSTRAINT `perguntas_capitulo` FOREIGN KEY (`CapituloId`) REFERENCES `capitulo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perguntas`
--

/*!40000 ALTER TABLE `perguntas` DISABLE KEYS */;
INSERT INTO `perguntas` (`Id`,`Pergunta`,`Dificuldade`,`Lingua`,`CapituloId`,`Tipo`) VALUES 
 (1,'Calcular o Quadrado de um numero',1,'PT',1,'Aula'),
 (2,'Calcular a área de um retângulo',1,'PT',1,'Aula'),
 (3,'Calcular a área de um triângulo',1,'PT',1,'Aula'),
 (4,'Verificar se um número é par ou ímpar',2,'PT',2,'Exame');
/*!40000 ALTER TABLE `perguntas` ENABLE KEYS */;


--
-- Definition of table `respostas`
--

DROP TABLE IF EXISTS `respostas`;
CREATE TABLE `respostas` (
  `TesteId` int(10) NOT NULL AUTO_INCREMENT,
  `PerguntasId` int(10) NOT NULL,
  `Nota` int(2) NOT NULL DEFAULT '0',
  `Resposta` varbinary(MAX) DEFAULT NULL,
  PRIMARY KEY (`TesteId`,`PerguntasId`),
  KEY `PerguntasId` (`PerguntasId`),
  CONSTRAINT `respostas_teste` FOREIGN KEY (`TesteId`) REFERENCES `teste` (`Id`),
  CONSTRAINT `respostas_perguntas` FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respostas`
--

/*!40000 ALTER TABLE `respostas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostas` ENABLE KEYS */;


--
-- Definition of table `solucao`
--

DROP TABLE IF EXISTS `solucao`;
CREATE TABLE `solucao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Entradas` varchar(255) NOT NULL,
  `Saidas` varchar(255) NOT NULL,
  `PerguntasId` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `PerguntasId` (`PerguntasId`),
  CONSTRAINT `solucao_perguntas` FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solucao`
--

/*!40000 ALTER TABLE `solucao` DISABLE KEYS */;
INSERT INTO `solucao` (`Id`,`Entradas`,`Saidas`,`PerguntasId`) VALUES 
 (1,'0','0',1),
 (2,'2','4',1),
 (3,'-1','1',1),
 (4,'0/n2','0',2),
 (5,'2/n3','6',2);
/*!40000 ALTER TABLE `solucao` ENABLE KEYS */;


--
-- Definition of table `teste`
--

DROP TABLE IF EXISTS `teste`;
CREATE TABLE `teste` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) NOT NULL,
  `UtilizadoresId` int(10) NOT NULL,
  `Duracao` time NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `teste_utilizadores` (`UtilizadoresId`),
  CONSTRAINT `teste_utilizadores` FOREIGN KEY (`UtilizadoresId`) REFERENCES `utilizadores` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teste`
--

/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
INSERT INTO `teste` (`Id`,`Descricao`,`UtilizadoresId`,`Duracao`) VALUES 
 (1,'1º Teste Avaliação',1,'00:00:10'),
 (2,'1º Teste Avaliação',1,'00:00:10'),
 (4,'2º Teste Avaliação',2,'00:00:30');
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;


--
-- Definition of table `utilizadores`
--

DROP TABLE IF EXISTS `utilizadores`;
CREATE TABLE `utilizadores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Morada` varchar(255) NOT NULL,
  `Contacto` int(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilizadores`
--

/*!40000 ALTER TABLE `utilizadores` DISABLE KEYS */;
INSERT INTO `utilizadores` (`Id`,`Nome`,`Morada`,`Contacto`,`Email`) VALUES 
 (1,'Tiago','Rua Tiago Antunes da Silva',1,'tiago@ipt.pt'),
 (2,'Luis','Rua Luis Silva da Costa',2,'luis@ipt.pt'),
 (3,'Hugo','Rua Bairro alto',3,'hugo@ipt.pt'),
 (4,'Paulo','Rua São Joao',4,'paulo@ipt.pt'),
 (5,'Carlos','Rua Delgado da Silva',5,'carlos@ipt.pt'),
 (6,'Diogo','Rua do Cavaquinho',6,'diogo@ipt.pt'),
 (7,'Filipe','Rua Jorge Carvalho',7,'filipe@ipt.pt'),
 (8,'Maria','Rua Deolinda Costa',8,'maria@ipt.pt'),
 (9,'Claudia','Rua Jose Cordeiro',9,'claudia@ipt.pt'),
 (10,'Jose','Rua do vizinho do lado',10,'jose@ipt.pt');
/*!40000 ALTER TABLE `utilizadores` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
