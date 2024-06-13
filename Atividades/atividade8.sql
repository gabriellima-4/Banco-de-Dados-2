-- Atividade -> Update - Alterando dados na tabela ITEM_PRODUTO do Projeto Pedido

Alterar dados na tabela ITEM_PRODUTO em conformidade com os enunciados a seguir:
-- a. Para os itens dos pedidos de NUMERO menor que 20 e maior que 50, com
-- e produtos com código de 203 a 205, inclusive: Multiplicar a
-- QUANTIDADE por 2

-- RESOLUÇÃO:
Update ITEM_PRODUTO
SET QUANTIDADE = QUANTIDADE * 2
WHERE NUMERO_PED < 20 OR NUMERO_PED > 50
  AND CODIGO_PRO BETWEEN 203 AND 205;



-- b. Para o cliente de CODIGO ímpar com vendedor de MATRICULA par: somar
-- 15 na QUANTIDADE.

-- RESOLUÇÃO:
Update ITEM_PRODUTO as IP
SET QUANTIDADE = QUANTIDADE + 15
WHERE exists (
    Select 1
    from PEDIDO as p
    where p.NUMERO = IP.NUMERO_PED
        AND MOD(p.CODIGO_CLI, 2) = 1
        AND MOD(p.MATRICULA_VEN, 2) = 0
);



-- c. Para pedidos com NUMERO múltiplo de 3: Retirar R$ 0.50 no valor de
-- cada preço unitário.

-- RESOLUÇÃO:
Update ITEM_PRODUTO
SET PRECO_UNITARIO = PRECO_UNITARIO - 0.50
WHERE MOD(NUMERO_PED, 3) = 0;



-- d. Ajustar o valor total de cada item de produto no pedido (VALOR_ITEM),
-- em conformidade com a quantidade e preço unitário.

-- RESOLUÇÃO:
Update ITEM_PRODUTO
set VALOR_ITEM = QUANTIDADE * PRECO_UNITARIO;



-- e. Ajustar o total da fatura de todos os pedidos, em conformidade com os
-- valores dos itens incluídos em cada pedido.

-- RESOLUÇÃO:
Update PEDIDO AS P
SET Total_Fatura = (
    Select SUM(IP.VALOR_ITEM)
    from ITEM_PRODUTO as IP
    where IP.NUMERO_PED = p.NUMERO;
)