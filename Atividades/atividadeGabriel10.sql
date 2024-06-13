-- Select // 12/06/2024

-- a. Listar os vendedores . Mostrar: Vendedor (MATRICULA e NOME).
-- Ordenados pelo nome decrescente.
-- RESOLUÇÃO:

Select MATRICULA, NOME from VENDEDOR
Order by NOME DESC;



-- b. Listar distintamente os clientes PJ. Mostrar: Nome do cliente
-- (CLIENTE), CNPJ e CIDADE onde reside. Ordenados pelo nome do cliente
-- ascendente e, dentro deste, pela cidade descendente.
-- RESOLUÇÃO:

Select Distinct c.NOME AS CLIENTE, pj.CNPJ, c.CIDADE from CLIENTE c
INNER JOIN PJ pj on c.CODIGO = pj.CODIGO_CLI
Order By c.NOME ASC, c.CIDADE DESC;



-- c. Listar os vendedores e seus pedidos já realizados com total de
-- fatura entre R$ 1000,00 e R$ 5000,00, inclusive.. Mostrar: Nome do
-- vendedor (VENDEDOR), número do pedido (PEDIDO),data do pedido (DATA)
-- com a formatação 'dd/mm/yyyy'. Ordenados pelo nome do vendedor
-- descendente e, dentro deste, pela data ascendente.
-- RESOLUÇÃO:

Select v.NOME AS Vendedor, p.NUMERO AS PEDIDO, TO_CHAR(p.DATA, "DD/MM/YYYY") AS DATA from VENDEDOR
INNER JOIN PEDIDO p ON v.MATRICULA = p.MATRICULA_VEN
where p.TOTAL_FATURA between 1000 AND 5000
Order By v.NOME DESC, p.DATA ASC;