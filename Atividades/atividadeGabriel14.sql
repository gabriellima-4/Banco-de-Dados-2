-- Queries média 3 // 13/06/2024

-- a. Inserir uma prateleira de código 390, descrição 'Prateleira de
-- teste' e número de seções 2.
-- RESOLUÇÃO:
INSERT INTO PRATELEIRA (CODIGO, DESCRICAO, SEÇÕES)
VALUES (390, "Prateleira de Teste", 2)



-- c. Selecionar todos os clientes da view VIEW_CLIENTE que são PF.
-- Mostrar: CODIGO, NOME e CNPF, ordenado decrescente pelo nome do
-- cliente.
-- RESOLUÇÃO:
SELECT CODIGO, NOME, CNPF
FROM VIEW_CLIENTE
WHERE TIPO = 'PF'
ORDER BY NOME DESC;


-- d. Listar os pedidos e seus respectivos produtos. Mostrar: numero do
-- pedido (PEDIDO), DATA do pedido, descrição do produto (PRODUTO) e
-- QUANTIDADE de produtos no pedido. Ordenado pela DATA do pedido
-- crescente e, dentro das datas, pelo produto decrescente.
-- RESOLUÇÃO:
SELECT( 
    p.NUMERO AS PEDIDO, 
    p.DATA, 
    pr.DESCRICAO AS PRODUTO, 
    ip.QUANTIDADE
)
from PEDIDO p
INNER JOIN ITEM_PRODUTO ip ON p.NUMERO = ip.NUMERO_PED
INNER JOIN PRODUTO pr ON ip.CODIGO_PRO = pr.CODIGO
ORDER BY p.DATA ASC, pr.DESCRICAO DESC;
