--Inserts das tabelas Compra, Compra_produto, Venda e Venda_produto - PARTE 01 - COMENTADO


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