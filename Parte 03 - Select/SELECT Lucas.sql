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