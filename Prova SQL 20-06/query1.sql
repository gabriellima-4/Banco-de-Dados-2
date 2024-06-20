-- Prova de SQL // 20/06/2024

-- Fazer uma query para selecionar as mercadorias que não possuem entradas nos almoxarifados.
-- Mostrar: CODIGO, DESCRICAO da mercadoria e unidades de medida (UNID).
-- Ordenação: crescente pelo CODIGO da mercadoria.

Select CODIGO, DESCRICAO, UNIDADE_MEDIDA AS UNID FROM MERCADORIA
LEFT JOIN ENTRADA_MERCADORIA em ON CODIGO.MERCADORIA = em.MER_CODIGO 
WHERE em.MER_CODIGO IS NULL
ORDER BY MERCADORIA.CODIGO ASC;