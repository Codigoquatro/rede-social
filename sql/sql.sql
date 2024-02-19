-- Criar o banco de dados se não existir
CREATE DATABASE IF NOT EXISTS rede;

-- Selecionar o banco de dados recém-criado
USE rede;

-- Excluir tabelas se existirem
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS seguidores;
DROP TABLE IF EXISTS publicacoes;

-- Criar a tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    nick VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(150) NOT NULL,
    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Criar a tabela de seguidores
CREATE TABLE seguidores (
    usuario_id INT NOT NULL,
    seguidor_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (seguidor_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    PRIMARY KEY (usuario_id, seguidor_id)
) ENGINE=InnoDB;

-- Criar a tabela de publicações
CREATE TABLE publicacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    conteudo VARCHAR(300) NOT NULL,
    autor_id INT NOT NULL,
    curtidas INT DEFAULT 0,
    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Inserir dados de teste na tabela de seguidores
INSERT INTO seguidores (usuario_id, seguidor_id)
VALUES
(1, 2),
(3, 5),
(1, 3);

-- Exemplo de consulta utilizando INNER JOIN
SELECT u.id, u.nome, u.nick, u.email, u.criadoEm
FROM usuarios u
INNER JOIN seguidores s ON u.id = s.seguidor_id
WHERE s.usuario_id = 2;

INSERT INTO publicacoes (titulo,conteudo,autor_id)
VALUES
("Publicação do Usuário 1","Essa é a publicação do uusário 1!",1),
("Publicação do Usuário 2","Essa é a publicação do uusário 2!",2),
("Publicação do Usuário 3","Essa é a publicação do uusário 3!",3):