------------------ GERAR BANCO FÍSICO ------------------


--Comandos para gerar o banco físico da floricultura

CREATE TABLE Pessoa (
	cod_pessoa serial PRIMARY KEY,
	nome varchar(100) NOT NULL,
	data_nasc date NOT NULL,
	rg varchar(20) NOT NULL,
	cpf varchar(20) NOT NULL,
	endereco varchar(100) NOT NULL,
	num_endereco integer NOT NULL,
	cidade varchar(100) NOT NULL,
	uf varchar(2),
	telefone varchar(20),
	celular varchar(20),
	email varchar(100) NOT NULL
);

CREATE TABLE Funcionario (
	cod_func serial PRIMARY KEY,
	cargo varchar(50) NOT NULL,
	salario numeric NOT NULL,
	cod_pessoa integer,
	CONSTRAINT func_pessoa_fk FOREIGN KEY(cod_pessoa) REFERENCES Pessoa (cod_pessoa)
);

CREATE TABLE Cliente (
	cod_cli serial PRIMARY KEY,
	n_cartao varchar(50),
	cod_pessoa integer,
	CONSTRAINT cli_pessoa_fk FOREIGN KEY(cod_pessoa) REFERENCES Pessoa (cod_pessoa)
);

CREATE TABLE Pagamento (
	cod_pagto serial PRIMARY KEY,
	descricao varchar(100) NOT NULL
);

CREATE TABLE Venda (
	cod_venda serial PRIMARY KEY,
	data date NOT NULL,
	valor numeric NOT NULL,
	cod_pagto integer,
	cod_cli integer,
	cod_func integer,
	CONSTRAINT venda_pagto_fk FOREIGN KEY(cod_pagto) REFERENCES Pagamento (cod_pagto),
	CONSTRAINT venda_cli_fk FOREIGN KEY(cod_cli) REFERENCES Cliente (cod_cli),
	CONSTRAINT venda_func_fk FOREIGN KEY(cod_func) REFERENCES Funcionario (cod_func)
);

CREATE TABLE Estoque (
	cod_estoque serial PRIMARY KEY,
	qtd_prod integer NOT NULL
);

CREATE TABLE Categoria (
	cod_cat serial PRIMARY KEY,
	descricao varchar(100) NOT NULL
);

CREATE TABLE Produto (
	cod_prod serial PRIMARY KEY,
	nome varchar(100) NOT NULL,
	preco numeric NOT NULL,
	cod_cat integer,
	cod_estoque integer,
	CONSTRAINT prod_cat_fk FOREIGN KEY(cod_cat) REFERENCES Categoria (cod_cat),
	CONSTRAINT prod_estoque_fk FOREIGN KEY(cod_estoque) REFERENCES Estoque (cod_estoque)
);

CREATE TABLE Venda_produto (
	PRIMARY KEY(cod_venda,cod_prod),
	cod_venda integer,
	cod_prod integer,
	qtd_prod_venda integer NOT NULL,
	CONSTRAINT vp_venda_fk FOREIGN KEY(cod_venda) REFERENCES Venda (cod_venda),
	CONSTRAINT vp_prod_fk FOREIGN KEY(cod_prod) REFERENCES Produto (cod_prod)
);

CREATE TABLE Compra (
	cod_compra serial PRIMARY KEY,
	data date NOT NULL
);

CREATE TABLE Compra_produto (
	PRIMARY KEY(cod_compra,cod_prod),
	cod_compra integer,
	cod_prod integer,
	qtd_prod_compra integer NOT NULL,
	CONSTRAINT cp_compra_fk FOREIGN KEY(cod_compra) REFERENCES Compra (cod_compra),
	CONSTRAINT cp_prod_fk FOREIGN KEY(cod_prod) REFERENCES Produto (cod_prod)
);


------------------ INSERTS ------------------


--Inserts das tabelas Pessoa, Cliente e Funcionário do banco floricultura

INSERT INTO Pessoa (nome, data_nasc, rg, cpf, endereco, num_endereco, cidade, uf, telefone, celular, email) VALUES
	('Jorge Geraldo Gomes', '1996-02-17', '12.510.264-1', '266.137.802-27', 'Rua Fábio Anchieta',
	 '127', 'Aracaju', 'SE', '(79) 2999-0087', '(79) 98640-6625', 'jorgegeraldogomes@quarttus.com.br'),
    ('Isadora Nair Bárbara Melo', '1991-12-16', '14.107.936-8', '571.576.018-69', '9ª Travessa Bom Jesus',
	 '326', 'Maceió', 'AL', '(82) 2843-2493', '(82) 98926-3032', 'isadoranairbarbaramelo@igi.com.br'),
    ('Emanuel Luiz André Fernandes', '1986-03-01', '20.166.616-9', '328.295.557-08', 'Rua Carapebus',
	 '314', 'Feira de Santana', 'BA', '(75) 3626-3368', '(75) 99746-3895', 'emanuelluizaf@msltecnologia.com.br'),
    ('Brenda Stefany Fernandes', '1981-03-01', '34.248.523-4', '997.239.766-17', 'Rua Contorno',
	 '987', 'Aracaju', 'SE', '(79) 3645-2990', '(79) 98832-8459', 'bbrendastefanyfernandes@unicamp.br'),
    ('Rafael Enzo Heitor da Luz', '1993-05-04', '43.258.460-2', '888.069.087-66', 'Rua Luiz Delfino',
	 '375', 'Magé', 'RJ', '(21) 3689-7189', '(21) 98835-7837', 'rrafaelenzoheitordaluz@patriciagrillo.adv.br'),
    ('Emanuelly Patrícia Silveira', '1996-07-24', '11.421.401-3', '234.619.726-22', 'Rua General Vieira de Melo',
	 '216', 'Rio Branco', 'AC', '(68) 2860-8369', '(68) 98811-5224', 'eemanuellypatriciasilveira@unimedsjc.com.br'),
    ('Tiago Sérgio Sales', '1969-07-08', '27.645.598-8', '135.754.174-07', 'Rua Castro Alves',
	 '174', 'Cariacica', 'ES', '(27) 2825-6268', '(27) 99834-5572', 'ttiagosergiosales@oul.com.br'),
    ('Luana Andreia Lopes', '1977-01-22', '38.267.907-6', '672.830.477-00', 'Beco São Braz',
	 '777', 'Belo Horizonte', 'MG', '(31) 2809-1657', '(31) 99857-7918', 'luanaandreialopes_@yaooh.com'),
    ('Sérgio Otávio Galvão', '1983-09-20', '28.600.275-9', '403.967.953-90', 'Rua Castelo Branco',
	 '279', 'Cariacica', 'ES', '(27) 2747-6638', '(27) 99508-0387', 'ssergiootaviogalvao@prestec.com.br'),
    ('Rebeca Catarina Silveira', '1990-01-24', '15.951.840-4', '450.528.326-72', 'Quadra QN 410 Conjunto A',
	 '168', 'Brasília', 'DF', '(61) 2889-6240', '(61) 98229-4340', 'rebecacatarinasilveira_@pubdesign.com.br'),
    ('Nelson Pedro Henrique Thomas Gomes', '1989-12-18', '14.325.038-3', '389.311.757-10', 'Travessa Acacias',
	 '359', 'Olinda', 'PE', '(81) 2942-3928', '(81) 99117-3919', 'nelsonpedrohenriquethomasgomes@plastic.com.br'),
    ('Allana Mariah Josefa da Mota', '1958-02-24', '18.197.817-9', '416.068.795-45', 'Quadra QR 48',
	 '852', 'Planaltina', 'GO', '(61) 2554-5068', '(61) 98423-0040', 'allanamariahjosefadamota@ozzape.com'),
    ('Leandro Theo Nogueira', '1961-05-19', '49.565.578-8', '499.757.260-89', 'Rua Júpiter',
	 '486', 'Três Lagoas', 'MS', '(67) 2973-7645', '(67) 98374-4926', 'leandrotheonogueira@aprimor.com'),
    ('Malu Hadassa Assunção', '1965-01-14', '45.290.868-1', '895.549.427-02', 'Rua Quero-quero',
	 '102', 'Serra', 'ES', '(27) 2757-0124', '(27) 98153-6326', 'mmaluhadassaassuncao@uniube.br'),
    ('Matheus Miguel Araújo', '1974-04-04', '22.888.220-5', '035.281.244-31', 'Rua Oto Wilmann',
	 '208', 'Nova Iguaçu', 'RJ', '(21) 3767-7149', '(21) 98135-1027', 'matheusmiguelaraujo-92@mectron.com.br'),
    ('Isabela Bianca Catarina Caldeira', '1978-05-02', '47.122.024-3', '869.217.065-83', 'Rua Wilson Carvalho Viana',
	 '464', 'Três Lagoas', 'MS', '(67) 2857-6955', '(67) 99808-4908', 'isabelabiancacatarinacaldeira_@tita.com.br'),
    ('João Severino Araújo', '1957-05-19', '20.059.603-2', '216.518.465-70', 'Travessa Araribóia',
	 '607', 'Boa Vista', 'RR', '(95) 3717-0792', '(95) 99765-9723', 'joaoseverinoaraujo@eletrovip.com'),
    ('Hadassa Stefany Fernandes', '1969-06-14', '36.841.714-1', '217.670.255-72', 'Travessa Amajari',
	 '832', 'Boa Vista', 'RR', '(95) 3833-8886', '(95) 98300-3160', 'hadassastefanyfernandes@gruposantin.com.br'),
    ('Manoel André Otávio Almeida', '1990-04-12', '18.122.325-9', '702.524.178-44', 'Rua Custódio Gomes de Azevedo',
	 '156', 'Sobral', 'CE', '(88) 2565-1767', '(88) 98376-5371', 'manoelandreotavioalmeida@zk.arq.br'),
    ('Tânia Jaqueline Tereza Pereira', '1996-02-10', '17.251.598-1', '200.768.380-64', 'Rua 19 de Julho',
	 '864', 'Manaus', 'AM', '(92) 2843-3140', '(92) 98949-5212', 'ttaniajaquelinetp@jerasistemas.com.br');
	 
INSERT INTO Cliente (n_cartao, cod_pessoa) VALUES 
	('4716 5138 5004 7605', 1), ('5242 0630 5187 3136', 2), ('3769 549670 89636', 3), ('3035 276995 4800', 4), 
	('2014 9771701 9108', 5), ('3551 0492 9887 1462', 6) , ('86999 3547 95778 3', 7), ('4011 5588 9771 1251', 8), 
	('6011 6490 2551 8125', 9), ('4 7160 4890 5308', 10);
	
INSERT INTO Funcionario (cargo, salario, cod_pessoa) VALUES
	('Vendedor', 1500.00, 11), ('Vendedor', 1500.00, 12), ('Limpeza', 1200.00, 13), ('Limpeza', 1200.00, 14),
	('Botânico', 2500.00, 15), ('Botânico', 2500.00, 16), ('Gerente', 3000.00, 17), ('Gerente', 3000.00, 18),
	('Estagiário', 750.00, 19), ('Estagiário', 750.00, 20);

--Inserts das tabelas Pagamento, Categoria, Estoque e Produto

INSERT INTO Pagamento (descricao) VALUES
	('Dinheiro'), ('Cheque'), ('Cartão de Crédito'), ('Cartão de Débito'), ('Nota Promissória'), 
	('Crediário'), ('Boleto'), ('Depósito Bancário'), ('Tranferência Bancária'), ('Online');

INSERT INTO Categoria (descricao) VALUES 
	('Plantas'), ('Flores'), ('Sementes'), ('Cestas'), ('Vasos'),
	('Arranjos'), ('Buquês'), ('Coroas'), ('Presentes'), ('Insumos');
	
INSERT INTO Estoque (qtd_prod) VALUES
	(3), (2), (1), (1), (0), (4), (3), (2), (1), (0);

INSERT INTO Produto (nome, preco, cod_cat, cod_estoque) VALUES
	('20 Sementes de Orquídea', 10.00, 3, 1), ('Buquê de 30 Rosas Vermelhas', 230.00, 7, 2),
	('Cesta de Flores do Campo', 150.00, 4, 3), ('Cachepot de Cerâmica', 80.00, 5, 4),
	('Violeta', 15.00, 2, 5), ('Cacto Mandacaru Pote 30L', 100.00, 1, 6),
	('Mix de Margaridas vaso de vidro', 50.00, 6, 7), ('Coroa de Flores para Velório', 600.00, 8, 8),
	('Terra Vegetal 5 Kg', 10.00, 10, 9), ('Cesta de Chocolate', 150.00, 9, 10);

--Inserts das tabelas Compra, Compra_produto, Venda e Venda_produto - PARTE 01 - PROCESSO COMENTADO

--SEQUÊNCIA COMPRA - Conjunto de código necessário quando realiza um INSERT na tabela Compra:
INSERT INTO Compra (data) VALUES ('2017-01-05');

--Quando é gerada uma compra é necessário informar quantos produtos foram comprados e a sua quantidade:
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (1, 2, 4), (1, 4, 2), (1, 5, 1);
--Compra 1: 3 produtos comprados, quantidade comprada para cada produto: 4, 2 e 1

--Quando é gerada uma compra de um produto deve-se também dar baixa no estoque de cada produto comprado:

--Estoque do produto de código 2 (Compra 1):
UPDATE Estoque SET qtd_prod = 6	WHERE cod_estoque = 2;
	
--Estoque do produto de código 4 (Compra 1):
UPDATE Estoque SET qtd_prod = 3	WHERE cod_estoque = 4;

--Estoque do produto de código 5 (Compra 1):
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 5;


--SEQUÊNCIA VENDA - Conjunto de código necessário quando realiza um INSERT na tabela Venda:
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-06', 0.00, 1, 3, 5);

--Quando é gerada uma venda é necessário informar quantos produtos foram vendidos e a sua quantidade:
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (1, 3, 1), (1, 6, 2);
--OBSERVAÇÃO: verificar se há produtos suficientes no estoque antes de fechar a venda
--Venda 1: 2 produtos vendidos, quantidade vendida para cada produto: 1 e 2

--Assim pode-se calcular o total da venda agora:
UPDATE Venda SET valor = 350.00 WHERE cod_venda = 1;

--Quando é gerada uma venda de um produto deve-se também dar baixa no estoque de cada produto vendido:

--Estoque do produto de código 3 (Venda 1):
UPDATE Estoque SET qtd_prod = 0	WHERE cod_estoque = 3;
	
--Estoque do produto de código 6 (Venda 1):
UPDATE Estoque SET qtd_prod = 2	WHERE cod_estoque = 6;

--Inserts das tabelas Compra, Compra_produto, Venda e Venda_produto - PARTE 02

--OBSERVAÇÃO: Inserts separados por ordem cronológica, importante para o controle do estoque

--SEQUÊNCIA COMPRA 2
INSERT INTO Compra (data) VALUES ('2017-01-09');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (2, 8, 3);
UPDATE Estoque SET qtd_prod = 5	WHERE cod_estoque = 8;

--SEQUÊNCIA VENDA 2
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-11', 0.00, 3, 4, 2);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (2, 1, 2), (2, 7, 3), (2, 9, 1);
UPDATE Venda SET valor = 180.00 WHERE cod_venda = 2;
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 0 WHERE cod_estoque = 7;
UPDATE Estoque SET qtd_prod = 0 WHERE cod_estoque = 9;

--SEQUÊNCIA COMPRA 3
INSERT INTO Compra (data) VALUES ('2017-01-12');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (3, 7, 5), (3, 9, 1);
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 7;
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 9;

--SEQUÊNCIA VENDA 3
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-15', 0.00, 7, 6, 1);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (3, 1, 1), (3, 2, 3), (3, 4, 2), (3, 6, 2), (3, 8, 4);
UPDATE Venda SET valor = 3460.00 WHERE cod_venda = 3;
UPDATE Estoque SET qtd_prod = 0 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 3 WHERE cod_estoque = 2;
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 4;
UPDATE Estoque SET qtd_prod = 0 WHERE cod_estoque = 6;
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 8;

--SEQUÊNCIA VENDA 4
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-16', 0.00, 1, 9, 9);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (4, 2, 2), (4, 4, 1), (4, 5, 1), (4, 7, 3);
UPDATE Venda SET valor = 705.00 WHERE cod_venda = 4;
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 2;
UPDATE Estoque SET qtd_prod = 0 WHERE cod_estoque = 4;
UPDATE Estoque SET qtd_prod = 0 WHERE cod_estoque = 5;
UPDATE Estoque SET qtd_prod = 2 WHERE cod_estoque = 7;

--SEQUÊNCIA COMPRA 4
INSERT INTO Compra (data) VALUES ('2017-01-18');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (4, 3, 3), (4, 4, 5), (4, 5, 4);
UPDATE Estoque SET qtd_prod = 3 WHERE cod_estoque = 3;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 4;
UPDATE Estoque SET qtd_prod = 4 WHERE cod_estoque = 5;

--SEQUÊNCIA COMPRA 5
INSERT INTO Compra (data) VALUES ('2017-01-19');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (5, 1, 10), (5, 2, 5), (5, 6, 3), (5, 7, 5);
UPDATE Estoque SET qtd_prod = 10 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 6 WHERE cod_estoque = 2;
UPDATE Estoque SET qtd_prod = 3 WHERE cod_estoque = 6;
UPDATE Estoque SET qtd_prod = 7 WHERE cod_estoque = 7;

--SEQUÊNCIA COMPRA 6
INSERT INTO Compra (data) VALUES ('2017-01-21');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (6, 8, 2), (6, 9, 9), (6, 10, 10);
UPDATE Estoque SET qtd_prod = 3 WHERE cod_estoque = 8;
UPDATE Estoque SET qtd_prod = 10 WHERE cod_estoque = 9;
UPDATE Estoque SET qtd_prod = 10 WHERE cod_estoque = 10;

--SEQUÊNCIA VENDA 5
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-22', 0.00, 3, 8, 1);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (5, 1, 2), (5, 5, 2), (5, 10, 1);
UPDATE Venda SET valor = 200.00 WHERE cod_venda = 5;
UPDATE Estoque SET qtd_prod = 8 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 2 WHERE cod_estoque = 5;
UPDATE Estoque SET qtd_prod = 9 WHERE cod_estoque = 10;

--SEQUÊNCIA COMPRA 7
INSERT INTO Compra (data) VALUES ('2017-01-23');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (7, 3, 2), (7, 5, 4), (7, 6, 2);
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 3;
UPDATE Estoque SET qtd_prod = 6 WHERE cod_estoque = 5;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 6;

--SEQUÊNCIA VENDA 6
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-24', 0.00, 9, 3, 1);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (6, 2, 1), (6, 4, 2), (6, 5, 2), (6, 7, 2);
UPDATE Venda SET valor = 520.00 WHERE cod_venda = 6;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 2;
UPDATE Estoque SET qtd_prod = 3 WHERE cod_estoque = 4;
UPDATE Estoque SET qtd_prod = 4 WHERE cod_estoque = 5;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 7;

--SEQUÊNCIA VENDA 7
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-24', 0.00, 1, 6, 2);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (7, 1, 3), (7, 3, 2), (7, 9, 4), (7, 10, 1);
UPDATE Venda SET valor = 520.00 WHERE cod_venda = 7;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 3 WHERE cod_estoque = 3;
UPDATE Estoque SET qtd_prod = 6 WHERE cod_estoque = 9;
UPDATE Estoque SET qtd_prod = 8 WHERE cod_estoque = 10;

--SEQUÊNCIA COMPRA 8
INSERT INTO Compra (data) VALUES ('2017-01-25');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (8, 3, 3), (8, 4, 3), (8, 8, 2);
UPDATE Estoque SET qtd_prod = 6 WHERE cod_estoque = 3;
UPDATE Estoque SET qtd_prod = 6 WHERE cod_estoque = 4;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 8;

--SEQUÊNCIA COMPRA 9
INSERT INTO Compra (data) VALUES ('2017-01-26');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (9, 1, 4), (9, 2, 3);
UPDATE Estoque SET qtd_prod = 9 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 8 WHERE cod_estoque = 2;

--SEQUÊNCIA VENDA 8
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-26', 0.00, 1, 4, 10);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (8, 1, 4), (8, 4, 5), (8, 7, 3);
UPDATE Venda SET valor = 590.00 WHERE cod_venda = 8;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 4;
UPDATE Estoque SET qtd_prod = 2 WHERE cod_estoque = 7;

--SEQUÊNCIA COMPRA 10
INSERT INTO Compra (data) VALUES ('2017-01-26');
INSERT INTO Compra_produto (cod_compra, cod_prod, qtd_prod_compra) VALUES (10, 9, 5);
UPDATE Estoque SET qtd_prod = 11 WHERE cod_estoque = 9;

--SEQUÊNCIA VENDA 9
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-27', 0.00, 6, 3, 1);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (9, 2, 3), (9, 3, 2), (9, 6, 4);
UPDATE Venda SET valor = 1390.00 WHERE cod_venda = 9;
UPDATE Estoque SET qtd_prod = 5 WHERE cod_estoque = 2;
UPDATE Estoque SET qtd_prod = 4 WHERE cod_estoque = 3;
UPDATE Estoque SET qtd_prod = 1 WHERE cod_estoque = 6;

--SEQUÊNCIA VENDA 10
INSERT INTO Venda (data, valor, cod_pagto, cod_cli, cod_func) VALUES ('2017-01-28', 0.00, 7, 2, 2);
INSERT INTO Venda_produto (cod_venda, cod_prod, qtd_prod_venda) VALUES (10, 1, 2), (10, 5, 2), (10, 9, 3), (10, 10, 2);
UPDATE Venda SET valor = 380.00 WHERE cod_venda = 10;
UPDATE Estoque SET qtd_prod = 3 WHERE cod_estoque = 1;
UPDATE Estoque SET qtd_prod = 2 WHERE cod_estoque = 5;
UPDATE Estoque SET qtd_prod = 8 WHERE cod_estoque = 9;
UPDATE Estoque SET qtd_prod = 6 WHERE cod_estoque = 10;


------------------ SELECTS E VIEWS --------------------


-- exibe qnt prod, nome, descricao e preco dos produtos em ordem crescente da qnt prod
--INTENÇÃO: saber a quantidade dos produtos em estoque
SELECT e.qtd_prod, p.nome, c.descricao, p.preco 
	FROM Estoque e, Produto p, Categoria C 
	WHERE p.cod_estoque = e.cod_estoque 
	AND c.cod_cat = p.cod_cat
	ORDER BY e.qtd_prod;

--exibe vendas feitas pelo funcionario de código 2, mostrando nome do funcionário, código, data e valor das vendas
--INTENÇÃO: saber quais as vendas realizadas pelo funcionário 2
SELECT p.nome, v.cod_venda, v.data, pg.descricao, v.valor
	FROM Funcionario f, Pessoa p, Venda v, Pagamento pg
	WHERE f.cod_func = 2 
	AND f.cod_pessoa = p.cod_pessoa
	AND v.cod_func = f.cod_func
	AND v.cod_pagto = pg.cod_pagto;

-- exibe todas as pessoas (clientes e funcionários) da cidade de Sobral, exibindo todos os campos da tabela Pessoa
--INTENÇÃO: saber quais pessoas que são cidade de Sobral
SELECT * FROM Pessoa p WHERE p.cidade = 'Sobral';

-- VIEW
-- Exibe todas as vendas geradas pelo cliente de código 3
--INTENÇÃO: saber todas as vendas geradas pelo cliente de código 3
CREATE VIEW procura_cliente AS 
	SELECT ps.nome AS nome_pessoa, p.nome AS nome_produto, p.preco, vp.qtd_prod_venda, v.data 
	FROM Venda v, Venda_produto vp, Produto p, Pessoa ps, Cliente c
	WHERE c.cod_cli = 3 
	AND p.cod_prod = vp.cod_prod 
	AND vp.cod_venda = v.cod_venda
	AND c.cod_pessoa = ps.cod_pessoa
	AND c.cod_cli = v.cod_cli;
	
SELECT * FROM procura_cliente;

--exibe o nome, descrição, quantidade em estoque, preço e quantidade total comprada dos produtos pela floricultura
--INTENÇÃO: saber os produtos mais comprados pela floricultura, saber quais precisam ser repostos com maior frequência
SELECT p.nome, c.descricao, e.qtd_prod AS estoque, p.preco, SUM(cp.qtd_prod_compra) AS qtd_comprado 
	FROM produto p 
	INNER JOIN estoque e ON p.cod_estoque = e.cod_estoque 
	INNER JOIN categoria c	ON p.cod_cat = c.cod_cat 
	INNER JOIN compra_produto cp ON p.cod_prod = cp.cod_prod 
	GROUP BY p.nome, c.descricao, e.qtd_prod, p.preco 
	ORDER BY SUM(cp.qtd_prod_compra) DESC;

--exibe o nome, descrição, quantidade em estoque, preço e quantidade total vendida dos produtos na floricultura
--INTENÇÃO: saber os produtos que mais vendem na floricultura
SELECT p.nome, c.descricao, p.preco, SUM(vp.qtd_prod_venda) AS qtd_vendida
	FROM produto p 
	INNER JOIN categoria c	ON p.cod_cat = c.cod_cat 
	INNER JOIN venda_produto vp ON p.cod_prod = vp.cod_prod 
	GROUP BY p.nome, c.descricao, p.preco
	ORDER BY SUM(vp.qtd_prod_venda) DESC;
	
--exibe nome, cidade, celular e total gasto pelos clientes na floricultura
--INTENÇÃO: saber os clientes que mais gastam na floricultura
SELECT p.nome, p.cidade, p.celular, SUM(v.valor) AS total_gasto 
	FROM pessoa p 
	INNER JOIN cliente c ON p.cod_pessoa = c.cod_pessoa 
	INNER JOIN venda v ON c.cod_cli = v.cod_cli
	GROUP BY p.nome, p.cidade, p.celular 
	ORDER BY SUM(v.valor) DESC;

--exibe os tipos de pagamento juntamente com total de vendas realizadas com essa forma de pagamento, e,
--o total das vendas de cada tipo de pagamento
--INTENÇÃO: saber quais os tipos de pagamento mais utilizados na floricultura e o total das vendas
SELECT p.descricao AS tipo_pagto, COUNT(p.cod_pagto) AS qtd_vedas, SUM(v.valor) AS total_vendas
	FROM pagamento p 
	INNER JOIN venda v ON p.cod_pagto = v.cod_pagto 
	GROUP BY p.cod_pagto, p.descricao 
	ORDER BY SUM(v.valor) DESC;

--VIEW
--Seleciona o nome, cpf, cargo e quantidade de vendas de todos os funcionários no mês de Janeiro de 2017
--INTENÇÃO: saber qual funcionário vendeu mais no mês de Janeiro de 2017
CREATE VIEW func_vendas_01_2017 AS
	SELECT p.nome, p.cpf, f.cargo, COUNT(v.cod_venda) AS qtd_vendas 
	FROM pessoa p 
	INNER JOIN funcionario f ON p.cod_pessoa = f.cod_pessoa 
	INNER JOIN venda v ON f.cod_func = v.cod_func 
	WHERE date_trunc('month', v.data) = '2017-01-01' 
	GROUP BY p.nome, p.cpf, f.cargo
	ORDER BY COUNT(v.cod_venda) DESC;
	
SELECT * FROM func_vendas_01_2017;


------------------ STORED PROCEDURE --------------------


--Função para verificar se há quantidade disponível de um produto no estoque para poder adicioná-lo na venda
CREATE OR REPLACE FUNCTION verifica_venda_estoque(id_venda integer, id_prod integer, qtd_vendida integer) 
	RETURNS boolean AS $$
	DECLARE
		qtd_estoque integer;
	BEGIN
		SELECT INTO qtd_estoque e.qtd_prod FROM Estoque e 
			INNER JOIN Produto p ON p.cod_estoque = e.cod_estoque
			WHERE p.cod_prod = id_prod;
		
		IF qtd_vendida <= qtd_estoque THEN 
			INSERT INTO Venda_produto(cod_venda, cod_prod, qtd_prod_venda) VALUES(id_venda, id_prod, qtd_vendida);
			qtd_estoque := qtd_estoque - qtd_vendida;
			UPDATE Estoque SET qtd_prod = qtd_estoque WHERE cod_estoque = (SELECT e.cod_estoque FROM Estoque e 
					INNER JOIN Produto p ON p.cod_estoque = e.cod_estoque WHERE p.cod_prod = id_prod);
			RAISE NOTICE 'Produto adicionado a venda';
			RETURN true;
		ELSE
			RAISE NOTICE 'Produto não pode ser adicionado na venda (Não há quantidade disponível em estoque)';
			RETURN false;
		END IF;
	END;
	$$ LANGUAGE 'plpgsql';

--Caso de Teste 1: Positivo
SELECT verifica_venda_estoque(10, 3, 2);
--Caso de Teste 2: Negativo
SELECT verifica_venda_estoque(10, 4, 2);

--Consulta para verificar se o produto 3 foi adicionado na venda de código 10
SELECT * FROM Venda_produto WHERE cod_venda = 10 ORDER BY cod_prod;