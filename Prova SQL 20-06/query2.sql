-- Prova de SQL // 20/06/2024

-- Fazer uma query para selecionar os almoxarifados distintos e ativos que tiveram pelo menos
-- uma entrada de mercadorias nos seus estoques.
-- Mostrar: CODIGO e NOME do almoxarifado.
-- Ordenação: Descresente pelo NOME do almoxarifado.

SELECT DISTINCT a.CODIGO, a.NOME FROM ALMOXARIFADO a
JOIN ENTRADA_MERCADORIA em ON a.CODIGO = em.ALM_CODIGO
WHERE a.SITUACAO = "ativo"
ORDER BY a.NOME DESC;