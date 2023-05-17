-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE projetoIndividual;

USE projetoIndividual;


CREATE TABLE Usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
    sobrenome VARCHAR(50),
    dtNasc date,
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE Estatistica (
	idEstatistica INT PRIMARY KEY AUTO_INCREMENT,
	planeja_pilotar CHAR(1),
	contato_aviacao CHAR(1),
    fkUsuario INT,
	FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);


/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
