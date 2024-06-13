/*
BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Insert - Incluindo dados no Projeto
Pedido - Parte 1
Queries implementadas na linguagem SQL aplicadas no SGBDR Oracle, apoiadas no
SqlDeveloper. Utilizar o MER Físico e BD Pedido disponibilizado para treinamento da disciplina
de Banco de Dados.
1) Copiar os dados do projeto pedido cujo o OWNER (PROPRIETÁRIO) seja o DEMO.
Todas as tabelas do usuário DEMO estão compartilhadas para leitura, exceto
ITEM_PRODUTO.
*/
-- SOLUÇÃO
-- Inclusão de CLIENTE
INSERT INTO CLIENTE
SELECT *
FROM DEMO.CLIENTE;
-- Inclusão de FONE_CLIENTE
INSERT INTO FONE_CLIENTE
SELECT *
FROM DEMO.FONE_CLIENTE;
-- Inclusão de VENDEDOR
INSERT INTO VENDEDOR
SELECT *
FROM DEMO.VENDEDOR;
-- Inclusão de FONE_VENDEDOR
INSERT INTO FONE_VENDEDOR
SELECT *
FROM DEMO.FONE_VENDEDOR;
-- Inclusão de PF
INSERT INTO PF
SELECT *
FROM DEMO.PF;
-- Inclusão de PJ
INSERT INTO PJ
SELECT *
FROM DEMO.PJ;
-- Inclusão de PEDIDO
INSERT INTO PEDIDO
SELECT *
FROM DEMO.PEDIDO;

-- Inclusão de PRATELEIRA
INSERT INTO PRATELEIRA
SELECT *
FROM DEMO.PRATELEIRA;
-- Inclusão de PRODUTO
INSERT INTO PRODUTO
SELECT *
FROM DEMO.PRODUTO;
-- Inclusão de CAPACIDADE_ESTOQUE
INSERT INTO CAPACIDADE_ESTOQUE
SELECT *
FROM DEMO.CAPACIDADE_ESTOQUE;
-- Inclusão de ESTOQUE
INSERT INTO ESTOQUE
SELECT *
FROM DEMO.ESTOQUE;
COMMIT;