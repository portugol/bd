/*
SQLyog Ultimate v9.62 
MySQL - 5.6.10 : Database - portugol
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`portugol` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `portugol`;

/*Table structure for table `capitulo` */

DROP TABLE IF EXISTS `capitulo`;

CREATE TABLE `capitulo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `capitulo` */

insert  into `capitulo`(`Id`,`Nome`,`Descricao`) values (1,'Calculo','Relacionado com problemas aritméticos'),(2,'Condicional','Relacionado com problemas que é necessário haver condições'),(3,'Decisao','Problemas de algoritmos se /escolhe'),(4,'Repetição','Problemas de algoritmos faz / enquanto / para / repete'),(5,'Arrays','Conjunto de dados todos do mesmo tipo que podem ser acedidos através de um índice'),(6,'Calculo','Relacionado com problemas aritméticos'),(7,'Condicional','Relacionado com problemas que é necessário haver condições'),(8,'Decisao','Problemas de algoritmos se /escolhe'),(9,'Repetição','Problemas de algoritmos faz / enquanto / para / repete'),(10,'Arrays','Conjunto de dados todos do mesmo tipo que podem ser acedidos através de um índice');

/*Table structure for table `perguntas` */

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `perguntas` */

insert  into `perguntas`(`Id`,`Pergunta`,`Dificuldade`,`Lingua`,`CapituloId`,`Tipo`) values (1,'Calcular o Quadrado de um numero',1,'PT',1,'Aula'),(2,'Calcular a área de um retângulo',1,'PT',1,'Aula'),(3,'Calcular a área de um triângulo',1,'PT',1,'Aula'),(4,'Verificar se um número é par ou ímpar',2,'PT',2,'Exame');

/*Table structure for table `respostas` */

DROP TABLE IF EXISTS `respostas`;

CREATE TABLE `respostas` (
  `TesteId` int(10) NOT NULL AUTO_INCREMENT,
  `PerguntasId` int(10) NOT NULL,
  `Nota` int(2) NOT NULL DEFAULT '0',
  `Resposta` varbinary(9999) DEFAULT NULL,
  PRIMARY KEY (`TesteId`,`PerguntasId`),
  KEY `PerguntasId` (`PerguntasId`),
  CONSTRAINT `respostas_perguntas` FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`),
  CONSTRAINT `respostas_teste` FOREIGN KEY (`TesteId`) REFERENCES `teste` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `respostas` */

/*Table structure for table `solucao` */

DROP TABLE IF EXISTS `solucao`;

CREATE TABLE `solucao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Entradas` varchar(255) NOT NULL,
  `Saidas` varchar(255) NOT NULL,
  `PerguntasId` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `PerguntasId` (`PerguntasId`),
  CONSTRAINT `solucao_perguntas` FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `solucao` */

insert  into `solucao`(`Id`,`Entradas`,`Saidas`,`PerguntasId`) values (1,'0','0',1),(2,'2','4',1),(3,'-1','1',1),(4,'0\\n2','0',2),(5,'2\\n3','6',2);

/*Table structure for table `teste` */

DROP TABLE IF EXISTS `teste`;

CREATE TABLE `teste` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) NOT NULL,
  `UtilizadoresId` int(10) NOT NULL,
  `Duracao` time NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `teste_utilizadores` (`UtilizadoresId`),
  CONSTRAINT `teste_utilizadores` FOREIGN KEY (`UtilizadoresId`) REFERENCES `utilizadores` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `teste` */

insert  into `teste`(`Id`,`Descricao`,`UtilizadoresId`,`Duracao`) values (1,'1º Teste Avaliação',1,'00:00:10'),(2,'1º Teste Avaliação',1,'00:00:10'),(3,'2º Teste Avaliação',2,'00:00:30');

/*Table structure for table `utilizadores` */

DROP TABLE IF EXISTS `utilizadores`;

CREATE TABLE `utilizadores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Morada` varchar(255) NOT NULL,
  `Contacto` int(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `utilizadores` */

insert  into `utilizadores`(`Id`,`Nome`,`Morada`,`Contacto`,`Email`) values (1,'Tiago','Rua Tiago Antunes da Silva',1,'tiago@ipt.pt'),(2,'Luis','Rua Luis Silva da Costa',2,'luis@ipt.pt'),(3,'Hugo','Rua Bairro alto',3,'hugo@ipt.pt'),(4,'Paulo','Rua São Joao',4,'paulo@ipt.pt'),(5,'Carlos','Rua Delgado da Silva',5,'carlos@ipt.pt'),(6,'Diogo','Rua do Cavaquinho',6,'diogo@ipt.pt'),(7,'Filipe','Rua Jorge Carvalho',7,'filipe@ipt.pt'),(8,'Maria','Rua Deolinda Costa',8,'maria@ipt.pt'),(9,'Claudia','Rua Jose Cordeiro',9,'claudia@ipt.pt'),(10,'Jose','Rua do vizinho do lado',10,'jose@ipt.pt');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
