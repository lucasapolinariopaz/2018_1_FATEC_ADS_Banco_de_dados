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
	