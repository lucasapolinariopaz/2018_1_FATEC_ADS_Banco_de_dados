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
