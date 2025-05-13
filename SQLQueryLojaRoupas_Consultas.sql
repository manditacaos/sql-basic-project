/*
CONSULTAS BÁSICAS
*/

--Quais os 5 produtos mais vendidos?
SELECT P.NomeProduto AS nome_produto,
    SUM(quantidade) AS total_vendido
FROM DetalhePedido DP
JOIN Produto P ON DP.idproduto = P.idproduto
GROUP BY P.NomeProduto
ORDER BY total_vendido DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

--Qual é a receita total de vendas por mês?
SELECT 
    FORMAT(DataPedido, 'MM-yyyy') AS mes_ano,
    SUM(total) AS total_vendas
FROM Pedido
GROUP BY FORMAT(DataPedido, 'MM-yyyy')
ORDER BY mes_ano;

--Qual o Ticket Médio?
SELECT 
	SUM (Total) / COUNT (*) AS TicketMedio
FROM Pedido;

--Quais clientes que mais gastaram no total?
SELECT 
    c.NomeCliente AS nome_cliente,
    SUM(p.Total) AS TotalGasto
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.NomeCliente
ORDER BY TotalGasto DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

--Quais clientes fizeram mais de 1 pedido?
SELECT 
	c.NomeCliente As NomeCliente, 
	COUNT(p.IdPedido) AS QuantidadePedido
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.NomeCliente, p.IdCliente
HAVING COUNT(IdPedido) > 1;

--Quais categorias de produto geraram mais vendas (quantidade)?
SELECT c.NomeCategoria AS Produto,
	   COUNT(p.IdCategoria) AS QuantidadePedido
FROM Produto p 
JOIN Categoria c ON p.IdCategoria = c.IdCategoria
GROUP BY c.NomeCategoria
ORDER BY QuantidadePedido DESC;

--Quantos pedidos foram feitos em cada estado (UF)?
SELECT c.Estado AS UF,
	COUNT(p.IdCliente) AS Quantidade_Pedido
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.Estado
ORDER BY Quantidade_Pedido DESC; 

--Qual foi o ticket médio por cidade dos clientes?
SELECT c.Cidade,
	SUM (p.Total) / COUNT (*) AS TicketMedio
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.Cidade
ORDER BY TicketMedio DESC;

--Qual a quantidade de vendas e receita gerada por produto?
SELECT p.NomeProduto, c.NomeCategoria,
		COUNT (dp.Idproduto) AS Quantidade,
		SUM(pe.total) AS Receita
FROM DetalhePedido dp
JOIN Pedido pe ON dp.IdPedido = pe.IdPedido
JOIN Produto p ON dp.IdProduto = p.IdProduto
JOIN Categoria c ON p.IdCategoria = c.IdCategoria
GROUP BY p.NomeProduto, c.NomeCategoria
ORDER BY Receita DESC;

--Qual a quantidade de vendas e receita gerada por categoria?
SELECT  c.NomeCategoria,
		COUNT (dp.Idproduto) AS Quantidade,
		SUM(pe.total) AS Receita
FROM DetalhePedido dp
JOIN Pedido pe ON dp.IdPedido = pe.IdPedido
JOIN Produto p ON dp.IdProduto = p.IdProduto
JOIN Categoria c ON p.IdCategoria = c.IdCategoria
GROUP BY  c.NomeCategoria
ORDER BY Receita DESC;

