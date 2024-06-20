-- Prova de SQL // 20/06/2024

-- Fazer uma query para selecionar os almoxarifados inativos (Situação) localizados
-- nos estados (UF) de São Paulo (SP) ou Goiás (GO).
-- Mostrar: Nome do Almoxarifado (ALMOXARIFADO) e a cidade em que está localizado (CIDADE).
-- Ordenação: Crescente pelo nome do Almoxarifado.

SELECT a.NOME, a.CIDADE FROM ALMOXARIFADO a
WHERE a.SITUACAO = "inativo" AND (a.UF = "GO" OR a.UF = "SP")
ORDER BY a.NOME ASC;