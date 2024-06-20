-- Table: USUARIO
CREATE TABLE USUARIO (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    NOME VARCHAR2(80) NOT NULL
);

-- Table: BIBLIOTECARIO
CREATE TABLE BIBLIOTECARIO (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    NOME VARCHAR2(60) NOT NULL
);

-- Table: AUTOR
CREATE TABLE AUTOR (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    NOME VARCHAR2(80) NOT NULL
);

-- Table: TITULO
CREATE TABLE TITULO (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    DESCRICAO VARCHAR2(100) NOT NULL
);

-- Table: CIDADE
CREATE TABLE CIDADE (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    NOME VARCHAR2(60) NOT NULL,
    UF VARCHAR2(2) NOT NULL
);

-- Table: PUBLICACAO
CREATE TABLE PUBLICACAO (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    ANO VARCHAR2(4) NOT NULL,
    EDICAO VARCHAR2(20) NOT NULL,
    AREA VARCHAR2(50) NOT NULL,
    RESUMO VARCHAR2(2000),
    CD_TIT NUMBER NOT NULL,
    CD_CID NUMBER NOT NULL,
    CD_AUT NUMBER NOT NULL,
    FOREIGN KEY (CD_TIT) REFERENCES TITULO(CODIGO),
    FOREIGN KEY (CD_CID) REFERENCES CIDADE(CODIGO),
    FOREIGN KEY (CD_AUT) REFERENCES AUTOR(CODIGO)
);

-- Table: LIVRO
CREATE TABLE LIVRO (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    VOLUME NUMBER,
    PAGINAS NUMBER(3),
    SITUACAO VARCHAR2(3),
    OBSERVACOES VARCHAR2(500),
    CD_PUB NUMBER NOT NULL,
    FOREIGN KEY (CD_PUB) REFERENCES PUBLICACAO(CODIGO)
);

-- Table: EMPRESTIMO
CREATE TABLE EMPRESTIMO (
    CODIGO NUMBER PRIMARY KEY NOT NULL,
    DT_EMPRESTIMO DATE NOT NULL,
    DT_DEVOLUCAO DATE,
    OBSERVACOES VARCHAR2(200),
    CD_USR NUMBER NOT NULL,
    CD_BIB NUMBER NOT NULL,
    CD_LIV NUMBER NOT NULL,
    FOREIGN KEY (CD_USR) REFERENCES USUARIO(CODIGO),
    FOREIGN KEY (CD_BIB) REFERENCES BIBLIOTECARIO(CODIGO),
    FOREIGN KEY (CD_LIV) REFERENCES LIVRO(CODIGO)
);