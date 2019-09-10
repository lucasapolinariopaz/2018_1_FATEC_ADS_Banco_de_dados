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