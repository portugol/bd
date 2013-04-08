ALTER TABLE Teste DROP FOREIGN KEY FKTeste452546;
ALTER TABLE Respostas DROP FOREIGN KEY FKRespostas935132;
ALTER TABLE Respostas DROP FOREIGN KEY FKRespostas531118;
ALTER TABLE Perguntas DROP FOREIGN KEY FKPerguntas773413;
ALTER TABLE Solucao DROP FOREIGN KEY FKSolucao53423;
DROP TABLE IF EXISTS Teste;
DROP TABLE IF EXISTS Utilizadores;
DROP TABLE IF EXISTS Perguntas;
DROP TABLE IF EXISTS Respostas;
DROP TABLE IF EXISTS Capitulo;
DROP TABLE IF EXISTS Solucao;
CREATE TABLE Teste (
  Id             int(10) NOT NULL AUTO_INCREMENT, 
  Descricao      int(10), 
  UtilizadoresId int(10) NOT NULL, 
  Duracao        time, 
  PRIMARY KEY (Id)) ENGINE=InnoDB;
CREATE TABLE Utilizadores (
  Id       int(10) NOT NULL AUTO_INCREMENT, 
  Nome     varchar(255) NOT NULL, 
  Morada   varchar(255) NOT NULL, 
  Contacto int(10) NOT NULL, 
  Email    varchar(255) NOT NULL, 
  PRIMARY KEY (Id)) ENGINE=InnoDB;
CREATE TABLE Perguntas (
  Id          int(10) NOT NULL AUTO_INCREMENT, 
  Pergunta    varchar(255), 
  Dificuldade int(1), 
  Lingua      varchar(255), 
  CapituloId  int(10) NOT NULL, 
  PRIMARY KEY (Id)) ENGINE=InnoDB;
CREATE TABLE Respostas (
  TesteId     int(10) NOT NULL, 
  PerguntasId int(10) NOT NULL, 
  Nota        int(2), 
  Resposta    varchar(255), 
  PRIMARY KEY (TesteId, 
  PerguntasId)) ENGINE=InnoDB;
CREATE TABLE Capitulo (
  Id        int(10) NOT NULL AUTO_INCREMENT, 
  Nome      varchar(255), 
  Descricao varchar(255), 
  PRIMARY KEY (Id)) ENGINE=InnoDB;
CREATE TABLE Solucao (
  Id          int(10) NOT NULL AUTO_INCREMENT, 
  Entradas    varchar(255), 
  Saidas      varchar(255), 
  PerguntasId int(10) NOT NULL, 
  PRIMARY KEY (Id)) ENGINE=InnoDB;
ALTER TABLE Teste ADD INDEX FKTeste452546 (UtilizadoresId), ADD CONSTRAINT FKTeste452546 FOREIGN KEY (UtilizadoresId) REFERENCES Utilizadores (Id);
ALTER TABLE Respostas ADD INDEX FKRespostas935132 (TesteId), ADD CONSTRAINT FKRespostas935132 FOREIGN KEY (TesteId) REFERENCES Teste (Id);
ALTER TABLE Respostas ADD INDEX FKRespostas531118 (PerguntasId), ADD CONSTRAINT FKRespostas531118 FOREIGN KEY (PerguntasId) REFERENCES Perguntas (Id);
ALTER TABLE Perguntas ADD INDEX FKPerguntas773413 (CapituloId), ADD CONSTRAINT FKPerguntas773413 FOREIGN KEY (CapituloId) REFERENCES Capitulo (Id);
ALTER TABLE Solucao ADD INDEX FKSolucao53423 (PerguntasId), ADD CONSTRAINT FKSolucao53423 FOREIGN KEY (PerguntasId) REFERENCES Perguntas (Id);
