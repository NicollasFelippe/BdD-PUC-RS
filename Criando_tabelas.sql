--criando as tabelas:

-- Tabela construtora
CREATE TABLE construtora(
	codigo			NUMBER(4),
	nome			VARCHAR(100)	NOT NULL,
	email			VARCHAR(40)		UNIQUE,
	nome_fantasia	VARCHAR (100)	NOT NULL,

CONSTRAINTS pk_construtora_codigo PRIMARY KEY (codigo)
);

-- tabela obra
CREATE TABLE obra (
    codigo_obra			NUMBER(4),
    nome				VARCHAR(100)	NOT NULL,
    logradoro			VARCHAR(100)	NOT NULL,
    numero				VARCHAR(6)		NOT NULL,
    complemento			VARCHAR(20),
    construtora_codigo	NUMBER(4),
CONSTRAINT pk_codigo_obra PRIMARY KEY (codigo_obra),
CONSTRAINT fk_construtora_codigo FOREIGN KEY (construtora_codigo) REFERENCES construtora(codigo)
);

-- tabela trabalhador
CREATE TABLE trabalhador (
    cpf					VARCHAR(20),
    nome				CHAR(30)		NOT NULL,
    salario				NUMBER(10,2)		NOT NULL,  -- colocar 10,2
    obra_trabalho		NUMBER (4),
CONSTRAINT pk_trabalhador_cpf PRIMARY KEY (cpf),
CONSTRAINT fk_obra_trabalho FOREIGN KEY (obra_trabalho) REFERENCES obra(codigo_obra)
);

-- Tabela categoria
CREATE TABLE categoria (
    codigo_categoria	NUMBER(5),
    descricao			VARCHAR(200) NOT NULL,
CONSTRAINTS pk_codigo_categoria PRIMARY KEY (codigo_categoria)
);

-- Tabela equipamento -- aqui aparentemente tem erro
CREATE TABLE equipamento(
	codigo_equipamento		NUMBER(5),
    nome					VARCHAR(100) NOT NULL,
    valor					NUMBER(5,2)  NOT NULL,
    categoria_equipamento	NUMBER(5),
CONSTRAINTS pk_codigo_equipamento PRIMARY KEY (codigo_equipamento),
CONSTRAINTS fk_categoria_equipamento FOREIGN KEY (categoria_equipamento) REFERENCES categoria(codigo_categoria)
);

-- Tabela que une obra e equipamentos
CREATE TABLE obra_equipamento(
    data_inicio				DATE,
    data_termino			DATE,
    codigo_equipamento 		NUMBER(5),
    codigo_obra				NUMBER(4),
CONSTRAINTS fk_obra_equipamento_codigo_equipamento FOREIGN KEY (codigo_equipamento) REFERENCES equipamento(codigo_equipamento),
CONSTRAINTS fk_obra_equipamento_codigo_obra FOREIGN KEY (codigo_obra) REFERENCES obra(codigo_obra),
CONSTRAINTS pk_obra_equipamentos PRIMARY KEY (data_inicio,data_termino,codigo_equipamento,codigo_obra)
);

--tabela telefone
CREATE TABLE telefone(
    numero		VARCHAR(20),
    contato		NUMBER(4),
CONSTRAINTS pk_telefone PRIMARY KEY (numero),
CONSTRAINTS fk_contato FOREIGN KEY (contato) REFERENCES construtora(codigo)
);