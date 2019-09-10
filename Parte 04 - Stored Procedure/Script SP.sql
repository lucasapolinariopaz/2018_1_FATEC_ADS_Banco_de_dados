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

--Consulta para verificar se o produto de código 3 foi adicionado na venda de código 10
SELECT * FROM Venda_produto WHERE cod_venda = 10 ORDER BY cod_prod;

--Restaurar dados do produto de código 3 antes de ter rodado a Stored Procedure
DELETE FROM Venda_produto WHERE cod_venda = 10 AND cod_prod = 3;
UPDATE Estoque SET qtd_prod = 4 WHERE cod_estoque = 3;