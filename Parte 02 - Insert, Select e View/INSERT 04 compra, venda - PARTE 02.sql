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