--Alterando tipo de dados para análises
ALTER TABLE DetalhePedido
ALTER COLUMN quantidade INT;

--Checando dados nulos
SELECT * FROM DetalhePedido
	WHERE Quantidade IS NULL OR Tamanho IS NULL;

SELECT * FROM Pedido
	WHERE DataPedido IS NULL OR Total IS NULL;

SELECT * FROM Produto
	WHERE NomeProduto IS NULL OR Preço IS NULL;

SELECT * FROM Cliente
	WHERE NomeCliente IS NULL OR Email IS NULL OR Cidade IS NULL OR Estado IS NULL;

SELECT * FROM Categoria
	WHERE NomeCategoria IS NULL;


-- Checando duplicatas
SELECT Quantidade, Tamanho FROM DetalhePedido
GROUP BY IdProduto, IdPedido, Quantidade, Tamanho
HAVING count(*) > 1;

SELECT DataPedido, Total FROM Pedido
GROUP BY IdCliente, DataPedido, Total
HAVING count(*) > 1;

SELECT NomeProduto FROM Produto
GROUP BY IdProduto, IdCategoria, NomeProduto, Preço
HAVING count(*) > 1;

SELECT NomeCliente FROM Cliente
GROUP BY NomeCliente, Email, Cidade, Estado
HAVING count(*) > 1;



