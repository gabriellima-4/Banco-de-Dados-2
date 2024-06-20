-- Fazer uma query para selecionar os livros com situação disponível. Mostrar Código e Observações. Ordenação: Ascendente pelo código do livro.
Select CODIGO, OBSERVACOES from LIVRO
where SITUACAO = "disponível"
Order By CODIGO ASC;


------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fazer uma query para selecionar as publicações existentes na biblioteca. Mostrar: nome do autor (AUTOR), título do livro (TÍTULO),
-- Cidade da publicação (CIDADE), edição (ED), unidade de federação (UF) e ano da publicação (ANO).
-- Ordenação: Decrescente pelo nome do autor e ascendente pelo ano de publicação.
Select (
    AUTOR.NOME as AUTOR,
    TITULO.DESCRICAO AS TITULO,
    CIDADE.NOME as CIDADE,
    PUBLICACAO.EDICAO as ED,
    CIDADE.UF as UF,
    PUBLICACAO.ANO as ANO
)
from PUBLICACAO
Inner Join AUTOR on PUBLICACAO.CD_AUT = AUTOR.CODIGO
Inner Join TITULO on PUBLICACAO.CD_TIT = TITULO.CODIGO
Inner Join CIDADE on PUBLICACAO.CD_CID = CIDADE.CODIGO
Order By AUTOR.NOME DESC, PUBLICACAO.ANO ASC;


--------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fazer uma query para selecionar a quantidade de empréstimo sem devolução por usuário.
-- Mostrar: O nome do usuário (USUÁRIO) e QDE_ESD.
-- Ordenação: Descendente pela quantidade de empréstimo sem devolução (QDE_ESD).

Select u.NOME AS USUARIO, COUNT(e.CODIGO) AS QDE_ESD from EMPRESTIMO e
Join USUARIO u ON e.CD_USR = u.CODIGO
where e.DT_DEVOLUCAO IS NULL
Group By u.NOME
Order By QDE_ESD DESC;


-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Fazer uma query para selecionar os bibliotecários que não realizaram empréstimos na biblioteca.
-- Mostrar: O código do bibliotecário (CODIGO) e o nome do bibliotecário (BIBLIOTECÁRIO).
-- Ordenação: Ascendente pelo código do bibliotecario.

Select b.CODIGO AS CODIGO, b.NOME AS BIBLIOTECARIO from BIBLIOTECARIO b
Left Join EMPRESTIMO e ON b.CODIGO = e.CD_BIB
where e.CD_BIB IS NULL
Order By b.CODIGO ASC;

--------------------------------------------------------------------------------------------------------------------------------------------------


-- Fazer uma query para selecionar os emprestimos sem devolução (sem data de devolução preenchida, significa não devolvido).
-- Mostrar: nome do usuário (USUARIO), nome do bibliotecário (BIBLIOTECARIO), código do livro (LIVRO), e data do empréstimo (DATA_EMPRESTIMO)
-- Ordenação: Crescente pelo nome do usuário.

Select u.NOME AS USUARIO, b.NOME AS BIBLIOTECARIO, e.CD_LIV AS LIVRO, e.DT_EMPRESTIMO AS DATA_EMPRESTIMO from EMPRESTIMO e
Join USUARIO u ON e.CD_USR = u.CODIGO
Join BIBLIOTECARIO b ON e.CD_BIB = b.CODIGO
where e.DT_EMPRESTIMO IS NULL
Order By u.NOME ASC;
