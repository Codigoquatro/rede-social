CREATE DATABASE IF NOT EXISTS rede;
USE rede;

DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS seguidores;

CREATE TABLE usuarios(
    id int auto_increment primary key,
    nome varchar(50) not null,
    nick varchar(50) not null unique,
    email varchar(50) not null unique,
    senha varchar(50) not null unique,
    criadoEm timestamp default current_
)ENGINE=INNODB;

CREATE TABLE seguidores(
    usario_id int not null,
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
    ON DELETE CASCADE,

    seguidor_id int not null,
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
    ON DELETE CASCADE,
    
    PRIMARY KEY (usuario_id,seguidor_id)
)ENGINE=INNODB;