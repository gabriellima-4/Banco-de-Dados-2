CREATE TABLE PEDIDO (
    NUMERO NUMBER(6) NOT NULL,
    DATA DATE NOT NULL,
    PRAZO_ENTREGA DATE,
    RUA VARCHAR2(80),
    NR NUMBER(4),
    BAIRRO VARCHAR2(50),
    COMPLEMENTO VARCHAR2(100),
    CIDADE VARCHAR2(50),
    UF VARCHAR2(2),
    CEP VARCHAR2(10),
    TOTAL_FATURA NUMBER(8,2),
    CODIGO_CLI NUMBER NOT NULL,
    MATRICULA_VEN NUMBER NOT NULL
);

ALTER TABLE PEDIDO
ADD CONSTRAINT PK_PEDIDO
PRIMARY KEY (NUMERO);

ALTER TABLE PEDIDO
ADD CONSTRAINT FK_PED_CLIENTE
FOREIGN KEY (CODIGO_CLI)
REFERENCES CLIENTE(CODIGO);

ALTER TABLE PEDIDO
ADD CONSTRAINT FK_PED_VENDEDOR
FOREIGN KEY (MATRICULA_VEN)
REFERENCES VENDEDOR(MATRICULA);


CREATE TABLE ESTOQUE (
    DATA_ENTRADA DATE NOT NULL,
    CODIGO_PRO NUMBER NOT NULL,
    CODIGO_PRA NUMBER(3) NOT NULL,
    QUANTIDADE NUMBER(5) NOT NULL,
    DATA_VALIDADE DATE
);

ALTER TABLE ESTOQUE
ADD CONSTRAINT PK_ESTOQUE
PRIMARY KEY (DATA_ENTRADA, CODIGO_PRO, CODIGO_PRA);

ALTER TABLE ESTOQUE
ADD CONSTRAINT FK_EST_PRODUTO
FOREIGN KEY (CODIGO_PRO)
REFERENCES PRODUTO(CODIGO);

ALTER TABLE ESTOQUE
ADD CONSTRAINT FK_EST_PRATELEIRAA
FOREIGN KEY (CODIGO_PRA)
REFERENCES PRATELEIRA(CODIGO);


CREATE TABLE CAPACIDADE_ESTOQUE (
    CODIGO_PRO NUMBER NOT NULL,
    CODIGO_PRA NUMBER(3) NOT NULL,
    QUANTIDADE NUMBER(5) NOT NULL
);

ALTER TABLE CAPACIDADE_ESTOQUE
ADD CONSTRAINT PK_CAPACIDADE_ESTOQUE
PRIMARY KEY (CODIGO_PRO, CODIGO_PRA);

ALTER TABLE CAPACIDADE_ESTOQUE
ADD CONSTRAINT FK_CAP_EST_PRODUTO
FOREIGN KEY (CODIGO_PRO)
REFERENCES PRODUTO(CODIGO);

ALTER TABLE CAPACIDADE_ESTOQUE
ADD CONSTRAINT FK_CAP_EST_PRATELEIRA
FOREIGN KEY (CODIGO_PRA)
REFERENCES PRATELEIRA(CODIGO);


CREATE TABLE ITEM_PRODUTO (
    CODIGO_PRO NUMBER NOT NULL,
    NUMERO_PED NUMBER(6) NOT NULL,
    QUANTIDADE NUMBER(5) NOT NULL,
    PRECO_UNITARIO NUMBER(5,2) NOT NULL,
    VALOR_ITEM NUMBER(7,2)
);

ALTER TABLE ITEM_PRODUTO
ADD CONSTRAINT PK_ITEM_PRODUTO
PRIMARY KEY (CODIGO_PRO, NUMERO_PED);

ALTER TABLE ITEM_PRODUTO
ADD CONSTRAINT FK_ITEM_PRODUTO
FOREIGN KEY (CODIGO_PRO)
REFERENCES PRODUTO(CODIGO);

ALTER TABLE ITEM_PRODUTO
ADD CONSTRAINT FK_ITEM_PEDIDO
FOREIGN KEY (NUMERO_PED)
REFERENCES PEDIDO(NUMERO);