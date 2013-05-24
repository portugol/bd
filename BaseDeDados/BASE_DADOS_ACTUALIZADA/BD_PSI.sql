-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 16-Maio-2013 às 20:36
-- Versão do servidor: 5.1.67
-- versão do PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `capitulo`
--

INSERT INTO `capitulo` (`Id`, `Nome`, `Descricao`) VALUES
(1, 'Cálculo', 'Relacionado com problemas de cálculo'),
(3, 'Condicional', 'Relacionado com problemas que é necessário haver condições'),
(4, 'Repetição', 'Relacionado com exercícios em que é necessário efetuar ciclos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lingua`
--

CREATE TABLE IF NOT EXISTS `lingua` (
  `IdLingua` int(5) NOT NULL AUTO_INCREMENT,
  `Lingua` varchar(30) NOT NULL,
  PRIMARY KEY (`IdLingua`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `lingua`
--

INSERT INTO `lingua` (`IdLingua`, `Lingua`) VALUES
(1, 'Português'),
(4, 'Inglês'),
(5, 'Ucraniano');

-- --------------------------------------------------------

--
-- Estrutura da tabela `linguagens_prog`
--

CREATE TABLE IF NOT EXISTS `linguagens_prog` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `CapituloId` (`CapituloId`),
  KEY `TipoP` (`TipoPg`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `perguntas`
--

INSERT INTO `perguntas` (`Id`, `Pergunta`, `Dificuldade`, `CapituloId`, `TipoPg`) VALUES
(11, 'Calcule a area do Retangulo?<br />\r\n<img alt="" src="data:image/jpeg;base64,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" /><br />', 1, 1, 1),
(12, 'Calcule a area do Circulo?<br />\r\n<img alt="" src="data:image/jpeg;base64,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" /><br />', 3, 1, 1);

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
  KEY `id_linguagem` (`Id_Linguagem`),
  KEY `id_pergunta` (`Id_Pergunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `respostas_perguntas` (`PerguntasId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `solucao_perguntas` (`PerguntasId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
  KEY `teste_utilizadores` (`UtilizadoresId`),
  KEY `tipo_teste` (`Tipo_Teste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tipo_Perg`
--

CREATE TABLE IF NOT EXISTS `Tipo_Perg` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `Tipo_Perg`
--

INSERT INTO `Tipo_Perg` (`Id`, `Tipo`) VALUES
(1, 'Exame'),
(2, 'Aula'),
(3, 'ExameAula');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_teste`
--

CREATE TABLE IF NOT EXISTS `tipo_teste` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Data_Inicio` date NOT NULL,
  `Data_Fim` date NOT NULL,
  `Duracao` int(11) NOT NULL,
  `Descricao` varchar(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tipo_teste`
--

INSERT INTO `tipo_teste` (`Id`, `Data_Inicio`, `Data_Fim`, `Duracao`, `Descricao`) VALUES
(3, '2013-05-16', '2013-05-16', 20, 'ola');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tipo_User`
--

CREATE TABLE IF NOT EXISTS `Tipo_User` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `Tipo_User`
--

INSERT INTO `Tipo_User` (`Id`, `Tipo`) VALUES
(1, 'Professor'),
(2, 'Aluno');

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
  KEY `Tipo_Utilizador` (`TipoUtilizador`),
  KEY `Lingua` (`Lingua`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`Id`, `Nome`, `Morada`, `Contacto`, `Email`, `Lingua`, `EmailMoodle`, `TipoUtilizador`, `Username`, `Passwrd`, `IsActive`) VALUES
(3, 'António Manso', 'Las Vegas', '123321123', 'Manso@gmail.com', 1, 'Manso@ipt.pt', 1, 'Manso', 'Manso', b'1');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD CONSTRAINT `CapituloId` FOREIGN KEY (`CapituloId`) REFERENCES `capitulo` (`Id`),
  ADD CONSTRAINT `TipoP` FOREIGN KEY (`TipoPg`) REFERENCES `Tipo_Perg` (`Id`);

--
-- Limitadores para a tabela `resolucoes`
--
ALTER TABLE `resolucoes`
  ADD CONSTRAINT `id_pergunta` FOREIGN KEY (`Id_Pergunta`) REFERENCES `perguntas` (`Id`),
  ADD CONSTRAINT `id_linguagem` FOREIGN KEY (`Id_Linguagem`) REFERENCES `linguagens_prog` (`Id`);

--
-- Limitadores para a tabela `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `respostas_perguntas` FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`),
  ADD CONSTRAINT `respostas_teste` FOREIGN KEY (`TesteId`) REFERENCES `teste` (`Id`);

--
-- Limitadores para a tabela `solucao`
--
ALTER TABLE `solucao`
  ADD CONSTRAINT `solucao_perguntas` FOREIGN KEY (`PerguntasId`) REFERENCES `perguntas` (`Id`);

--
-- Limitadores para a tabela `teste`
--
ALTER TABLE `teste`
  ADD CONSTRAINT `teste_utilizadores` FOREIGN KEY (`UtilizadoresId`) REFERENCES `utilizadores` (`Id`),
  ADD CONSTRAINT `tipo_teste` FOREIGN KEY (`Tipo_Teste`) REFERENCES `tipo_teste` (`Id`);

--
-- Limitadores para a tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD CONSTRAINT `Lingua` FOREIGN KEY (`Lingua`) REFERENCES `lingua` (`IdLingua`),
  ADD CONSTRAINT `Tipo_Utilizador` FOREIGN KEY (`TipoUtilizador`) REFERENCES `Tipo_User` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
