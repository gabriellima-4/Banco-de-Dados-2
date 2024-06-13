--- Views // 13/06/2024

-- a. Selecionar as constraints criadas da tabela ITEM_PRODUTO. Mostrar:
-- constraint_name (CONSTRAINT), constraint_type (TIPO) e
-- search_condition (CONDICAO). Ordenado pelo nome da constraint.
-- RESOLUÇÃO:
Select CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION from USER_CONSTRAINTS
where TABLE_NAME = 'ITEM_PRODUTO'
Order By CONSTRAINT_NAME;


-- b. Criar a view de clientes constante do BD Pedidos (VIEW_CLIENTE)
-- contendo os dados das tabelas CLIENTE, PF e PJ. Em conformidade com a
-- estrutura disponível no MER físico do projeto BD de Pedido.
-- RESOLUÇÃO:
CREATE VIEW_CLIENTE AS
Select (
    TIPO,
    c.CODIGO,
    c.NOME,
    pf.CNPF,
    pj.CNPJ
    CASE
        WHEN CNPJ is NULL THEN 'PF'
        ELSE 'PJ'
    END TIPO
)
from CLIENTE c;
Left JOIN PF pf on c.CODIGO = pf.CODIGO_CLI
Left JOIN PJ pj on c.CODIGO = pj.CODIGO_CLI;