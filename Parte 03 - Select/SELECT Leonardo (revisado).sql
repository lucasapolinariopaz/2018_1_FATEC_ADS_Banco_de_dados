-- exibe o nome do cliente, nome do produto, preço do produto, quantidade da compra e a 
-- data da compra de um cliente X (nesse caso, cliente de código 3)
SELECT ps.nome, p.nome, p.preco, vp.qtd_prod_venda, v.data 
	FROM Venda v, Venda_produto vp, Produto p, Pessoa ps, Cliente c 
	WHERE c.cod_cli = 3 
	AND p.cod_prod = vp.cod_prod 
	AND vp.cod_venda = v.cod_venda
	AND c.cod_cli = ps.cod_pessoa 
	AND c.cod_pessoa = v.cod_cli;

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

-- VIEW 1° select
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
