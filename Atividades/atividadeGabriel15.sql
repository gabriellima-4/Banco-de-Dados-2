-- BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Select - Queries dificuldade alta - 1

-- a. Criar a view que mostra estoque constante no BD Pedidos.
-- (VIEW_ESTOQUE) contendo os dados indicados no modelo apresentado.
-- RESOLUÇÃO:

CREATE VIEW_ESTOQUE AS
SELECT(
    p.DESCRICAO AS PRODUTO,
    SUM(e.QUANTIDADE) AS QUANTIDADE_ADQUIRIDA,
    NVL(SUM(ip.QUANTIDADE), 0) AS QUANTIDADE_SAIDA,
    QUANTIDADE_ADQUIRIDA - QUANTIDADE_SAIDA AS DISPONIVEL,
    p.UNID_MEDIDA
)
from PRODUTO p
Left Join ESTOQUE e ON p.CODIGO = e.CODIGO_PRO
Left Join ITEM_PRODUTO ip ON p.CODIGO = ip.CODIGO_PRO
Group By p.DESCRICAO, p.UNID_MEDIDA;