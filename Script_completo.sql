-- Scrip completo do trabalhado

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


-- populando as tabelas:

-- Categorias
INSERT INTO categoria (codigo_categoria,descricao) VALUES (1, 'Concretagem');
INSERT INTO categoria (codigo_categoria,descricao) VALUES (2, 'Acesso e Elevacao');
INSERT INTO categoria (codigo_categoria,descricao) VALUES (3, 'Geradores e Compressores');
INSERT INTO categoria (codigo_categoria,descricao) VALUES (4,'Andaimes');
INSERT INTO categoria (codigo_categoria,descricao) VALUES (5, 'Ferramenta Eletrica');

-- Constutoras:
INSERT INTO construtora (codigo,nome,nome_fantasia) VALUES (10,'Construtora Alfa S.A', 'Alfa Incorporacoes');

-- Equipamentos:
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (301,'Betoneira', 100.00,1);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (302,'Cortadora de Piso',10.00,1);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (303,'Mangote',30.50,1);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (304,'Guincho',250.00,2);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (305,'Gerador',451.00,3);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (306,'Piso Metalico',150.00,4);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (307,'Furadeira de Bancada',65.00,5);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (308,'Parafusadeira',37.00,5);
INSERT INTO equipamento (codigo_equipamento,nome,valor,categoria_equipamento) VALUES (309,'Plaina',25.00,5);

-- Obras:
INSERT INTO obra (codigo_obra, nome,logradoro,numero,complemento,CONSTRUTORA_codigo) VALUES (115, 'Condominio dos Lagos','Travessa dos Lagos','100','Norte',10);
INSERT INTO obra (codigo_obra, nome,logradoro,numero,complemento,construtora_codigo) VALUES (116,'Condominio Araras','Avenida Rio Grande','22','Lado A',10);

-- Telefone
INSERT INTO telefone (numero, contato) VALUES ('(51)3333-3334',10); 
INSERT INTO telefone (numero, contato) VALUES ('(51)3333-3335',10);
INSERT INTO telefone (numero, contato) VALUES ('(51)3333-3336',10);

-- Obra_equipamento
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (115,301,TO_DATE('18-03-2022', 'DD-MM-YYYY'), TO_DATE('24-10-2022', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (115,304,TO_DATE('20-04-2022', 'DD-MM-YYYY'), TO_DATE('02-08-2022', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (115,306,TO_DATE('06-07-2021', 'DD-MM-YYYY'), TO_DATE('18-07-2021', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (115,307,TO_DATE('04-03-2022', 'DD-MM-YYYY'), TO_DATE('20-03-2022', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (115,309,TO_DATE('04-08-2021', 'DD-MM-YYYY'), TO_DATE('10-08-2021', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (116,304,TO_DATE('22-10-2022', 'DD-MM-YYYY'), TO_DATE('25-10-2022', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (116,305,TO_DATE('07-03-2022', 'DD-MM-YYYY'), TO_DATE('10-03-2022', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (116,306,TO_DATE('12-09-2022', 'DD-MM-YYYY'), TO_DATE('21-09-2022', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (116,307,TO_DATE('16-08-2022', 'DD-MM-YYYY'), TO_DATE('24-08-2022', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (116,308,TO_DATE('23-10-2022', 'DD-MM-YYYY'), TO_DATE('25-10-2022', 'DD-MM-YYYY'));

-- Trabalhador
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('101.101.101-34','Jose Chaves',2200.00,115);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('102.102.102-91','Pedro Passos',3502.18,115);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('103.103.103-18','Maria Aparecida',2800.87,115);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('104.104.104-52','Carlos Dutra', 3100.00,116);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('105.105.105-85','Mario Pires',4323.29,116);


-- 2) Criando dados de uma construtora com meu nome
INSERT INTO construtora (codigo,nome,nome_fantasia,email) VALUES (1,'Nicollas Santos Construcoes S.A', 'Construtora Nico','nicoconstrucoes@email.com');
INSERT INTO telefone (numero, contato) VALUES ('(51)3446-3446',1);

-- 3) Criar 2 obras e 5 funcionários para cada uma dessas obras (i.e. 10 funcionários no total);
-- Obra:
INSERT INTO obra (codigo_obra, nome,logradoro,numero,complemento,CONSTRUTORA_CODIGO) VALUES (01, 'Condominio La Jolla','Rua Santa Cecilia','1358','Torre A',1);
INSERT INTO obra (codigo_obra, nome,logradoro,numero,complemento,CONSTRUTORA_CODIGO) VALUES (02, 'Condominio Fazendinha','Rua do comercio','1000','Acesso B',1);

-- funcionarios:
--Obra 1
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('101.102.103-30','Nilton Avelino',3500.00,1);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('101.102.103-31','Ricardo Rocha',2450.00,1);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('101.102.103-32','Adriano Souza',2271.75,1);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('101.102.103-33','Jose Roberto',1750.00,1);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('101.102.103-34','Vitor Gargioni',3000.95,1);

-- Obra 2
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('105.104.103-05','Gustavo Nunes',2450.00,2);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('105.104.103-04','Renato Porto',3120.00,2);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('105.104.103-03','Diego Costa',2200.25,2);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('105.104.103-02','Joao Pedro',1950.00,2);
INSERT INTO trabalhador (cpf,nome,salario,obra_trabalho) VALUES ('105.104.103-01','Mathias Vila',1700.95,2);

-- 4) Alocar pelo menos 4 equipamentos (de categorias diferentes) à primeira obra que você criou;
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (1,301,TO_DATE('01-03-2024', 'DD-MM-YYYY'), TO_DATE('20-03-2024', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (1,305,TO_DATE('28-02-2024', 'DD-MM-YYYY'), TO_DATE('30-03-2024', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (1,306,TO_DATE('01-03-2024', 'DD-MM-YYYY'), TO_DATE('24-04-2024', 'DD-MM-YYYY'));
INSERT INTO obra_equipamento (codigo_obra,codigo_equipamento,data_inicio,data_termino) VALUES (1,309,TO_DATE('12-02-2024', 'DD-MM-YYYY'), TO_DATE('05-04-2024', 'DD-MM-YYYY'));

--6) Codificar em SQL quatro consultas:

--a) Selecionar CPFs e nomes dos trabalhadores que ganham mais do que 2.500,00;
SELECT cpf, nome FROM trabalhador
where salario > 2500.00
order by nome;

--b) Selecionar nomes e salários dos trabalhadores da empresa ALFA, ordenados em ordem alfabética crescente;
SELECT trabalhador.nome, trabalhador.salario FROM trabalhador
JOIN obra ON trabalhador.obra_trabalho = obra.codigo_obra
WHERE obra.construtora_codigo = 10
ORDER BY NOME ASC;

--e) Selecionar os equipamentos que nunca foram utilizados em nenhuma obra.
SELECT equipamento.nome as Equipamento_Nao_Usados from equipamento
WHERE equipamento.codigo_equipamento NOT IN(
	SELECT codigo_equipamento FROM obra_equipamento
    );

-- d) Calcular e exibir a folha de pagamento de cada obra. Uma folha de pagamento é determinada pela soma dos salários dos seus trabalhadores.
SELECT obra.nome as Nome_Obra, sum(trabalhador.salario) as Folha_Pagamento FROM obra
join trabalhador ON trabalhador.obra_trabalho = obra.codigo_obra
GROUP BY obra.nome;













