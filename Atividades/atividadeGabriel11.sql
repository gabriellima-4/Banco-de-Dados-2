-- Metadados // 12/06/2024

-- 1) Selecionar os metadados das tabelas criadas pelo usuário logado.
Select * from USER_TABLES;


-- 2) Selecionar os metadados das colunas das tabelas criadas pelo usuário logado.
Select * from USER_TAB_COLUMNS;


-- 3) Selecionar os metadados das regras (constraints) implementadas nas tabelas criadas pelo usuário logado.
Select * from USER_CONSTRAINTS;


-- 4) Selecionar os metadados das regras (constraints) implementadas nas colunas das tabelas criadas pelo usuário logado.
Select * from USER_CONS_COLUMNS;
