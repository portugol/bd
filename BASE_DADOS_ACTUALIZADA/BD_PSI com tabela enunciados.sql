CREATE DATABASE IF NOT EXISTS `BD_PSI`;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET foreign_key_checks = 0;
--
-- Base de Dados: `BD_PSI`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `capitulo`
--

CREATE TABLE IF NOT EXISTS `capitulo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `enunciados`
--

CREATE TABLE IF NOT EXISTS `enunciados` (
  `Id_Configuracao` int(11) NOT NULL AUTO_INCREMENT,
  `Capitulo` int(11) NOT NULL,
  `Dificuldade` int(11) NOT NULL,
  `Num_Perguntas` int(11) NOT NULL,
  `Id_Tipoteste` int(11) NOT NULL,
  PRIMARY KEY (`Id_Configuracao`),
  FOREIGN KEY (`Id_Tipoteste`) REFERENCES `tipo_teste` (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `lingua`
--

CREATE TABLE IF NOT EXISTS `lingua` (
  `IdLingua` int(5) NOT NULL AUTO_INCREMENT,
  `Lingua` varchar(30) NOT NULL,
  PRIMARY KEY (`IdLingua`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `linguagens_prog`
--

CREATE TABLE IF NOT EXISTS `linguagens_prog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas`
--

CREATE TABLE IF NOT EXISTS `perguntas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Pergunta` varchar(8000) NOT NULL,
  `Dificuldade` int(1) NOT NULL,
  `CapituloId` int(11) NOT NULL,
  `TipoPg` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`CapituloId`) REFERENCES `capitulo` (`Id`),
  FOREIGN KEY (`TipoPg`) REFERENCES `Tipo_Perg` (`Id`)
) ENGINE=InnoDB;



-- --------------------------------------------------------

--
-- Estrutura da tabela `resolucoes`
--

CREATE TABLE IF NOT EXISTS `resolucoes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Pergunta` int(11) NOT NULL,
  `Id_Linguagem` int(11) NOT NULL,
  `Resolucao` varchar(21000) NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Id_Pergunta`) REFERENCES `perguntas` (`Id`),
  FOREIGN KEY (`Id_Linguagem`) REFERENCES `linguagens_prog` (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE IF NOT EXISTS `respostas` (
  `TesteId` int(10) NOT NULL AUTO_INCREMENT,
  `PerguntasId` int(10) NOT NULL,
  `Nota` int(2) NOT NULL DEFAULT '0',
  `Resposta` varbinary(60000) DEFAULT NULL,
  PRIMARY KEY (`TesteId`,`PerguntasId`),
  FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`),
  FOREIGN KEY (`TesteId`) REFERENCES `teste` (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solucao`
--

CREATE TABLE IF NOT EXISTS `solucao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Entradas` varchar(255) NOT NULL,
  `Saidas` varchar(255) NOT NULL,
  `PerguntasId` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `teste`
--

CREATE TABLE IF NOT EXISTS `teste` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UtilizadoresId` int(10) NOT NULL,
  `Nota` float NOT NULL DEFAULT '0',
  `Tipo_Teste` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`UtilizadoresId`) REFERENCES `utilizadores` (`Id`),
  FOREIGN KEY (`Tipo_Teste`) REFERENCES `tipo_teste` (`Id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tipo_Perg`
--

CREATE TABLE IF NOT EXISTS `Tipo_Perg` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_teste`
--

CREATE TABLE IF NOT EXISTS `tipo_teste` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Data_Inicio` date NOT NULL,
  `Data_Fim` date NOT NULL,
  `Duracao` int(11) NOT NULL,
  `Descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `Tipo_User`
--

CREATE TABLE IF NOT EXISTS `Tipo_User` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE IF NOT EXISTS `utilizadores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Morada` varchar(255) NOT NULL,
  `Contacto` varchar(10) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Lingua` int(5) NOT NULL,
  `EmailMoodle` varchar(255) DEFAULT NULL,
  `TipoUtilizador` int(10) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Passwrd` varchar(21000) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Lingua`) REFERENCES `lingua` (`IdLingua`),
  FOREIGN KEY (`TipoUtilizador`) REFERENCES `Tipo_User` (`Id`)
) ENGINE=InnoDB;

SET foreign_key_checks = 1;