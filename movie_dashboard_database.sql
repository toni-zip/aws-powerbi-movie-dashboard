-- Movie Dashboard Database
CREATE DATABASE filmes_db;

CREATE TABLE diretores (
    id_diretor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

INSERT INTO diretores (nome, nacionalidade, data_nascimento) VALUES
('Christopher Nolan','Britânico','1970-07-30'),
('Quentin Tarantino','Americano','1963-03-27'),
('Martin Scorsese','Americano','1942-11-17'),
('Denis Villeneuve','Canadense','1967-10-03'),
('Greta Gerwig','Americana','1983-08-04');

CREATE TABLE filmes (
    id_filme SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_lancamento INT,
    genero VARCHAR(50),
    duracao_min INT,
    nota_imdb DECIMAL(3,1),
    id_diretor INT REFERENCES diretores(id_diretor)
);

INSERT INTO filmes (titulo,ano_lancamento,genero,duracao_min,nota_imdb,id_diretor) VALUES
('Interestelar',2014,'Ficção Científica',169,8.7,1),
('Pulp Fiction',1994,'Crime',154,8.9,2),
('O Lobo de Wall Street',2013,'Biografia',180,8.2,3),
('Duna',2021,'Ficção Científica',155,8.0,4),
('Barbie',2023,'Comédia',114,7.0,5);

CREATE TABLE atores (
    id_ator SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

INSERT INTO atores (nome,nacionalidade,data_nascimento) VALUES
('Leonardo DiCaprio','Americano','1974-11-11'),
('Matthew McConaughey','Americano','1969-11-04'),
('Uma Thurman','Americana','1970-04-29'),
('Timothée Chalamet','Americano','1995-12-27'),
('Margot Robbie','Australiana','1990-07-02');

CREATE TABLE filme_ator (
    id_filme INT REFERENCES filmes(id_filme),
    id_ator INT REFERENCES atores(id_ator),
    personagem VARCHAR(100),
    PRIMARY KEY(id_filme,id_ator)
);

INSERT INTO filme_ator VALUES
(1,2,'Cooper'),
(2,3,'Mia Wallace'),
(3,1,'Jordan Belfort'),
(4,4,'Paul Atreides'),
(5,5,'Barbie');

CREATE TABLE streamings (
    id_streaming SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco_mensal DECIMAL(5,2)
);

INSERT INTO streamings (nome,preco_mensal) VALUES
('Netflix',39.90),
('Prime Video',19.90),
('Max',29.90),
('Disney+',43.90),
('Apple TV+',21.90);

CREATE TABLE filme_streaming (
    id_filme INT REFERENCES filmes(id_filme),
    id_streaming INT REFERENCES streamings(id_streaming),
    PRIMARY KEY(id_filme,id_streaming)
);

INSERT INTO filme_streaming VALUES
(1,2),(2,1),(3,1),(4,3),(5,4);

-- Example queries
SELECT f.titulo,d.nome AS diretor
FROM filmes f
JOIN diretores d ON f.id_diretor=d.id_diretor;

SELECT f.titulo,a.nome AS ator,fa.personagem
FROM filme_ator fa
JOIN filmes f ON fa.id_filme=f.id_filme
JOIN atores a ON fa.id_ator=a.id_ator;

SELECT f.titulo,s.nome AS streaming
FROM filme_streaming fs
JOIN filmes f ON fs.id_filme=f.id_filme
JOIN streamings s ON fs.id_streaming=s.id_streaming;
