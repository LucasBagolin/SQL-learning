-- 1) Listagem do cardápio ordenada por nome
SELECT 
  id_cafe,
  nome,
  descricao,
  preco_unitario
FROM cardapio
ORDER BY nome ASC;

-- 2) Comandas + itens, com total por item, ordenadas por data, id e nome do café
SELECT
  c.id_comanda,
  c.data_hora,
  c.mesa,
  c.cliente,
  ic.id_comanda                 AS comanda_no_item,
  ca.nome                       AS cafe,
  ca.descricao,
  ic.quantidade,
  ic.preco_unitario,
  (ic.quantidade * ic.preco_unitario) AS preco_total_item
FROM comanda c
JOIN item_comanda ic ON ic.id_comanda = c.id_comanda
JOIN cardapio ca     ON ca.id_cafe    = ic.id_cafe
ORDER BY c.data_hora, c.id_comanda, ca.nome;

-- 3) Total por comanda (ordenado por data)
SELECT
  c.id_comanda,
  c.data_hora,
  c.mesa,
  c.cliente,
  SUM(ic.quantidade * ic.preco_unitario) AS total_comanda
FROM comanda c
JOIN item_comanda ic ON ic.id_comanda = c.id_comanda
GROUP BY c.id_comanda, c.data_hora, c.mesa, c.cliente
ORDER BY c.data_hora;

-- 4) Comandas com mais de um tipo de café
SELECT
  c.id_comanda,
  c.data_hora,
  c.mesa,
  c.cliente,
  SUM(ic.quantidade * ic.preco_unitario) AS total_comanda
FROM comanda c
JOIN item_comanda ic ON ic.id_comanda = c.id_comanda
GROUP BY c.id_comanda, c.data_hora, c.mesa, c.cliente
HAVING COUNT(DISTINCT ic.id_cafe) > 1
ORDER BY c.data_hora;

-- 5) Faturamento total por data (ordenado por data)
SELECT
  DATE(c.data_hora) AS data,
  SUM(ic.quantidade * ic.preco_unitario) AS faturamento_do_dia
FROM comanda c
JOIN item_comanda ic ON ic.id_comanda = c.id_comanda
GROUP BY DATE(c.data_hora)
ORDER BY DATE(c.data_hora);