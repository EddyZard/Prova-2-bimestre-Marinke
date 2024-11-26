#EXERCICIO 2

#A
SELECT f.Nome, m.Numero, c.Total
FROM funcionario f
INNER JOIN funcionario_mesa fm
ON fm.IdFuncionario = f.IdFuncionario
INNER JOIN mesa m
ON m.IdMesa = fm.IdMesa
INNER JOIN pedido_itens p
ON p.IdMesa = m.IdMesa
INNER JOIN conta c
ON c.IdPedItens = p.IdPedItens
WHERE m.IdMesa = p.IdMesa
ORDER BY f.Nome;

#B
SELECT m.Numero AS `Número da Mesa`,
		prod.Nome AS `Nome do Produto`
FROM mesa m
INNER JOIN pedido_itens pit
ON pit.IdMesa = m.IdMesa
INNER JOIN produto prod
ON prod.IdProduto = pit.IdProduto
WHERE m.IdMesa = pit.IdMesa
ORDER BY m.Numero;

#C
DELIMITER //
CREATE PROCEDURE liberarMesa(IN numeroMesa INT)
BEGIN
	UPDATE mesa m
	SET m.IdStatus = 1
	WHERE m.Numero = numeroMesa;
END
//
DELIMITER;
