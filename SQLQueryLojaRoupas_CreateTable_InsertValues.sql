--Criar base de dados 
CREATE DATABASE LojaRoupas;
USE LojaRoupas;
GO

--Criar Tabelas

--Tabela Categoria (id pk e nome)
CREATE TABLE Categoria(
IdCategoria SMALLINT PRIMARY KEY IDENTITY(1,1),
NomeCategoria VARCHAR(50) NOT NULL
);

--Tabela Produtos (id pk, nome, preço, idcategoria fk)
CREATE TABLE Produto(
IdProduto SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
NomeProduto VARCHAR(50) NOT NULL,
Preço DECIMAL(5,2) NOT NULL,
IdCategoria SMALLINT NOT NULL,
CONSTRAINT fk_id_categoria FOREIGN KEY (IdCategoria)
	REFERENCES Categoria(IdCategoria) ON DELETE CASCADE
);

--Tabela Cliente (id pk, nome, email, cidade, estado)
CREATE TABLE Cliente(
IdCliente SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
NomeCliente VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL, 
Cidade VARCHAR(50) NOT NULL,
Estado CHAR(2) NOT NULL
);

SELECT * FROM Cliente;

--Tabela Pedidos (id pk, id cliente fk, data do pedido, valor total)
CREATE TABLE Pedido(
IdPedido SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
IdCliente SMALLINT NOT NULL,
DataPedido DATE,
Total DECIMAL(10,2),
CONSTRAINT fk_id_cliente FOREIGN KEY (IdCliente)
	REFERENCES Cliente(IdCliente) ON DELETE CASCADE
);

--Tabela de detalhes do pedido (id pk, id Pedido, id Produto, quantidade, tamanho, preço unitario)
CREATE TABLE DetalhePedido(
IdDetalhe SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
IdPedido SMALLINT NOT NULL,
IdProduto SMALLINT NOT NULL,
Quantidade VARCHAR(10) NOT NULL,
Tamanho VARCHAR(5) NOT NULL,
PreçoUnit DECIMAL(10,2),
CONSTRAINT fk_id_pedido FOREIGN KEY (IdPedido)
	REFERENCES Pedido(IdPedido) ON DELETE CASCADE,
CONSTRAINT fk_id_produto FOREIGN KEY (IdProduto)
	REFERENCES Produto(IdProduto) ON DELETE CASCADE
);

--Popular tabela Categoria
SELECT * FROM Categoria;

INSERT INTO Categoria (NomeCategoria)
VALUES
('Streetwear'),
('Casual'),
('Fitness'),
('Minimalista'),
('Oversized');

--Popular tabela Produtos 
SELECT * FROM Produto;

INSERT INTO Produto(NomeProduto, Preço, IdCategoria) 
VALUES
('Camiseta Oversized Preta', 89.90, 5),
('Calça Cargo Feminina', 149.90, 1),
('Top Esportivo DryFit', 59.90, 3),
('Blusa Canelada Manga Longa', 79.90, 4),
('Short Moletom Estonado', 69.90, 1),
('Camiseta Básica Branca', 49.90, 2),
('Calça Legging Suplex', 99.90, 3),
('Regata Cropped Minimal', 54.90, 4),
('Camisa Estampada Street', 119.90, 1),
('Saia Midi Casual', 89.90, 2);

--Popular Tabela Cliente
SELECT * FROM Cliente;

INSERT INTO Cliente(NomeCliente, Email, Cidade, Estado)
VALUES
('Amanda Souza', 'amanda.souza@email.com', 'São Paulo', 'SP'),
('Lucas Pereira', 'lucas.pereira@email.com', 'Rio de Janeiro', 'RJ'),
('Fernanda Lima', 'fernanda.lima@email.com', 'Belo Horizonte', 'MG'),
('Mateus Silva', 'mateus.silva@email.com', 'Porto Alegre', 'RS'),
('Juliana Castro', 'juliana.castro@email.com', 'Curitiba', 'PR'),
('Rafael Mendes', 'rafael.mendes@email.com', 'Campinas', 'SP'),
('Beatriz Rocha', 'beatriz.rocha@email.com', 'Salvador', 'BA'),
('Gabriel Martins', 'gabriel.martins@email.com', 'Recife', 'PE'),
('Isabela Santos', 'isabela.santos@email.com', 'Goiânia', 'GO'),
('Thiago Barbosa', 'thiago.barbosa@email.com', 'Fortaleza', 'CE'),
('Larissa Almeida', 'larissa.almeida@email.com', 'Niterói', 'RJ'),
('João Vitor', 'joao.vitor@email.com', 'Manaus', 'AM'),
('Camila Rezende', 'camila.rezende@email.com', 'Vitória', 'ES'),
('Diego Fernandes', 'diego.fernandes@email.com', 'São Paulo', 'SP'),
('Aline Duarte', 'aline.duarte@email.com', 'Florianópolis', 'SC'),
('Pedro Ramos', 'pedro.ramos@email.com', 'Campo Grande', 'SC'),
('Natália Torres', 'natalia.torres@email.com', 'Aracaju', 'SE'),
('Henrique Costa', 'henrique.costa@email.com', 'Belém', 'PA'),
('Vanessa Cardoso', 'vanessa.cardoso@email.com', 'João Pessoa', 'PB'),
('Eduardo Lopes', 'eduardo.lopes@email.com', 'Três Corações', 'MG');

--Polular tabela Pedido 
SELECT * FROM Pedido;

INSERT INTO Pedido (IdCliente, DataPedido,	Total)
VALUES
(1, '2025-01-15', 179.80),
(2, '2025-01-20', 89.90),
(3, '2025-01-22', 239.70),
(4, '2025-02-03', 149.90),
(5, '2025-02-10', 99.90),
(6, '2025-02-14', 189.80),
(7, '2025-03-01', 49.90),
(8, '2025-03-05', 299.70),
(9, '2025-03-09', 89.90),
(10, '2025-03-12', 149.90),
(11, '2025-03-15', 109.90),
(12, '2025-04-01', 89.90),
(13, '2025-04-04', 169.90),
(14, '2025-04-10', 119.90),
(15, '2025-04-12', 249.90),
(16, '2025-04-18', 59.90),
(17, '2025-04-22', 129.90),
(18, '2025-04-28', 149.90),
(19, '2025-05-01', 89.90),
(20, '2025-05-05', 209.90),
(1, '2025-05-07', 119.90),
(2, '2025-05-08', 189.80),
(3, '2025-05-09', 99.90),
(4, '2025-05-10', 49.90),
(5, '2025-05-11', 69.90),
(6, '2025-05-12', 139.90),
(7, '2025-05-13', 199.90),
(8, '2025-05-14', 89.90),
(9, '2025-05-15', 229.90),
(10, '2025-05-16', 159.90);

--Exclusão coluna PreçoUnit da tabela Detalhe Pedido
ALTER TABLE DetalhePedido
DROP COLUMN PreçoUnit;

--Popular tabela Detalhe do Pedido
SELECT * FROM DetalhePedido;

INSERT INTO DetalhePedido (IdPedido, IdProduto, Quantidade,	Tamanho)
VALUES
(1, 1, 1, 'M'),
(2, 2, 1, 'P'),
(3, 3, 2, 'G'),
(4, 4, 1, 'M'),
(5, 5, 1, 'M'),
(6, 6, 2, 'G'),
(7, 7, 1, 'P'),
(8, 8, 3, 'M'),
(9, 9, 1, 'GG'),
(10, 10, 1, 'M'),
(11, 1, 1, 'G'),
(12, 2, 1, 'P'),
(13, 3, 1, 'GG'),
(14, 4, 1, 'M'),
(15, 5, 2, 'G'),
(16, 6, 1, 'P'),
(17, 7, 1, 'M'),
(18, 8, 1, 'G'),
(19, 9, 1, 'GG'),
(20, 10, 2, 'M'),
(21, 1, 1, 'G'),
(22, 2, 2, 'P'),
(23, 3, 1, 'M'),
(24, 4, 1, 'M'),
(25, 5, 1, 'G'),
(26, 6, 1, 'GG'),
(27, 7, 2, 'P'),
(28, 8, 1, 'M'),
(29, 9, 1, 'G'),
(30, 10, 1, 'M');