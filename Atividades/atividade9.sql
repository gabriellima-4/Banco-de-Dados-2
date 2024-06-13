-- Deletar (excluir) dados em tabelas do projeto pedido, em conformidade com os enunciados a seguir:

-- a. Excluir os registros de PEDIDO em que o número seja ímpar, a
-- matrícula do vendedor 102 e o endereço de entrega não seja nulo.
-- Observação: Realizar a exclusão e verificar que os registros foram
-- excluídos apenas na transação.

-- RESOLUÇÃO:
DELETE from pedido
where MOD(NUMERO, 2) = 1
    AND MATRICULA_VEN = 102
    AND RUA IS NOT NULL;


-- b. Excluir os itens de produtos do menor número de pedido na última data
-- de inclusão de pedido (a data mais recente).
-- Observação: Realizar a exclusão e verificar que os registros foram
-- excluídos apenas na transação.

-- RESOLUÇÃO:
DELETE FROM ITEM_PRODUTO
WHERE NUMERO_PED = (
    Select MIN(NUMERO)
    FROM PEDIDO
    WHERE DATA = (SELECT MAX(DATA))
)


-- c. Desfazer as exclusões dos itens a. e b. da questão 4) acima.
-- Observação: Verificar que os registros estão nas respectivas tabelas.

-- RESOLUÇÃO:
ROLLBACK;

