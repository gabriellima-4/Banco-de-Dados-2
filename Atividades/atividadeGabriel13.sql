-- Select Join 2 // 13/06/2024

-- a. Query de consulta no dicionário de dados (catálogo). Selecionar
-- todas as tabelas do seu usuário (projeto). Mostrar: nome da tabela
-- (TABELA) ordenado crescente.
-- RESOLUÇÃO:

Select TABLE_NAME FROM USER_TABLES
Order By TABLE_NAME ASC;


-- b. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: numero do pedido (PEDIDO),
-- DATA, total da fatura (TOTAL), ordenado decrescente pela data do
-- pedido.
-- RESOLUÇÃO:
Select NUMERO, DATA, TOTAL_FATURA FROM PEDIDO
WHERE TOTAL_FATURA > 2000
Order By DATA DESC;

-- c. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: nome cliente (CLIENTE), numero
-- do pedido (PEDIDO),DATA, total da fatura (TOTAL), ordenado crescente
-- pelo nome do cliente.
-- RESOLUÇÃO:
Select c.NOME as CLIENTE, p.NUMERO AS PEDIDO, p.TOTAL_FATURA AS TOTAL FROM PEDIDO p
Left Join CLIENTE c on p.CODIGO_CLI = c.CODIGO
where TOTAL > 2000
Order By c.NOME ASC;