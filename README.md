# 🛍️ Projeto de Banco de Dados: Loja de Roupas Online (E-commerce)
Este projeto simula o banco de dados de uma loja de roupas online, com foco em análise descritiva de vendas, clientes, produtos e categorias. Ele foi desenvolvido com SQL Server e tem como objetivo demonstrar conhecimentos em modelagem, criação e consulta a banco de dados relacionais.

## 🔧 Estrutura do Banco de Dados
O banco de dados é composto pelas seguintes tabelas:
- Categoria: tipos de produtos.
- Produto: produtos da loja, vinculados à categoria.
- Cliente: clientes com nome, e-mail e localização.
- Pedido: pedidos realizados por clientes.
- DetalhesPedido: itens individuais dos pedidos, com tamanho e quantidade.

## 💾 Dados Simulados
- ✅ 5 categorias
- ✅ 10 produtos
- ✅ 20 clientes
- ✅ 30 pedidos
- ✅ 30 registros em detalhes dos pedidos

## 📊 Consultas e Análises Realizadas
**1. Top 5 Produtos Mais Vendidos**: 
Os produtos mais vendidos representam a preferência dos consumidores. Isso pode indicar tendências de moda, sazonalidade ou melhor aceitação das variações.
Esses produtos devem ser prioridade em estoque e marketing.
Query: 
```SQL
SELECT P.NomeProduto AS nome_produto,
    SUM(quantidade) AS total_vendido
FROM DetalhePedido DP
JOIN Produto P ON DP.idproduto = P.idproduto
GROUP BY P.NomeProduto
ORDER BY total_vendido DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
```
**2. Receita Total de Vendas por Mês**: 
A variação mensal da receita ajuda a identificar sazonalidade. Pode medir o impacto de campanhas de marketing.
Query:
```SQL
SELECT 
    FORMAT(DataPedido, 'MM-yyyy') AS mes_ano,
    SUM(total) AS total_vendas
FROM Pedido
GROUP BY FORMAT(DataPedido, 'MM-yyyy')
ORDER BY mes_ano;
```
**3. Ticket Médio**: 
Esse indicador é útil para entender o poder de compra do público. Identificar oportunidades de estratégias de aumento do ticket médio.
Query:
``` SQL
SELECT 
	SUM (Total) / COUNT (*) AS TicketMedio
FROM Pedido;
```
**4. Clientes que Mais Gastaram**: 
Clientes podem ser potenciais alvo de ações de fidelização como cupons exclusivos ou programa de pontos.
Query:
```sql
SELECT 
    c.NomeCliente AS nome_cliente,
    SUM(p.Total) AS TotalGasto
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.NomeCliente
ORDER BY TotalGasto DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
```
**5. Clientes com Mais de 1 Pedido**: 

Query:
```sql
SELECT 
	c.NomeCliente As NomeCliente, 
	COUNT(p.IdPedido) AS QuantidadePedido
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.NomeCliente, p.IdCliente
HAVING COUNT(IdPedido) > 1;
```
**6. Vendas por Categoria**: 
As categorias mais vendidas indicam o que deve ter maior investimento em estoque, marketing e variedade.
Query:
```sql
SELECT c.NomeCategoria AS Produto,
	   COUNT(p.IdCategoria) AS QuantidadePedido
FROM Produto p 
JOIN Categoria c ON p.IdCategoria = c.IdCategoria
GROUP BY c.NomeCategoria
ORDER BY QuantidadePedido DESC;
```
**7. Pedidos por Estado**: 
Saber os estados com mais pedidos ajuda na logística e decisões de marketing por Região.
```sql
SELECT c.Estado AS UF,
	COUNT(p.IdCliente) AS Quantidade_Pedido
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.Estado
ORDER BY Quantidade_Pedido DESC; 
```
**8. Receita e Volume por Produto**: 

Query:
```sql
SELECT p.NomeProduto, c.NomeCategoria,
		COUNT (dp.Idproduto) AS Quantidade,
		SUM(pe.total) AS Receita
FROM DetalhePedido dp
JOIN Pedido pe ON dp.IdPedido = pe.IdPedido
JOIN Produto p ON dp.IdProduto = p.IdProduto
JOIN Categoria c ON p.IdCategoria = c.IdCategoria
GROUP BY p.NomeProduto, c.NomeCategoria
ORDER BY Receita DESC;
```
**9.  Receita e Volume por Categoria**: 
Permite enxergar o peso de cada categoria na receita total. Identificar se a margem de lucro está alta ou baixa pelo volume vendido.
Query:
```sql
SELECT  c.NomeCategoria,
		COUNT (dp.Idproduto) AS Quantidade,
		SUM(pe.total) AS Receita
FROM DetalhePedido dp
JOIN Pedido pe ON dp.IdPedido = pe.IdPedido
JOIN Produto p ON dp.IdProduto = p.IdProduto
JOIN Categoria c ON p.IdCategoria = c.IdCategoria
GROUP BY  c.NomeCategoria
ORDER BY Receita DESC;
```
**10. Ticket médio por cidade**: 
Analisar o poder de compra por região especifica, permite direcionar melhor as campanhas e estratégias de marketing.
Query:
```sql
SELECT c.Cidade,
	SUM (p.Total) / COUNT (*) AS TicketMedio
FROM Pedido p
JOIN Cliente c ON p.IdCliente = c.IdCliente
GROUP BY c.Cidade
ORDER BY TicketMedio DESC;
```

## 🧠 Análise Descritiva
Com base nas consultas SQL, foi possível obter insights como:
- Quais os produtos e categorias mais vendidos
- Quem são os clientes mais valiosos e recorrentes
- Comportamento das vendas por estado e mês
- Ticket médio e receita geral do e-commerce
Essas informações podem ser usadas para **planejamento de estoque, campanhas de marketing, fidelização de clientes e otimização de vendas.**
