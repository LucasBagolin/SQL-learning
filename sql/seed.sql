-- Seed da base BomGosto
-- Executar no banco: cafeteria_bomgosto

-- 1) CARDÁPIO --------------------------------------------------------------
INSERT INTO cardapio (nome, descricao, preco_unitario) VALUES
('Expresso',   'Café curto e intenso',                       6.00),
('Cappuccino', 'Expresso com leite vaporizado e espuma',    10.00),
('Latte',      'Expresso com bastante leite vaporizado',     9.50),
('Mocha',      'Latte com calda de chocolate',              12.00),
('Americano',  'Expresso diluído em água quente',            7.00)
ON CONFLICT (nome) DO NOTHING;  -- evita erro se rodar duas vezes

-- 2) COMANDAS --------------------------------------------------------------
INSERT INTO comanda (data_hora, mesa, cliente) VALUES
('2025-10-25 09:15', 5, 'Ana'),
('2025-10-25 10:02', 3, 'Bruno'),
('2025-10-26 14:30', 2, 'Carla'),
('2025-10-26 18:10', 7, 'Diego');

-- 3) ITENS DAS COMANDAS ----------------------------------------------------
-- Comanda 1 (Ana): Expresso (1 un) + Cappuccino (1 un)
INSERT INTO item_comanda (id_comanda, id_cafe, quantidade, preco_unitario)
SELECT 1, id_cafe, 1, preco_unitario FROM cardapio WHERE nome = 'Expresso';

INSERT INTO item_comanda (id_comanda, id_cafe, quantidade, preco_unitario)
SELECT 1, id_cafe, 1, preco_unitario FROM cardapio WHERE nome = 'Cappuccino';

-- Comanda 2 (Bruno): Latte (2 un)
INSERT INTO item_comanda (id_comanda, id_cafe, quantidade, preco_unitario)
SELECT 2, id_cafe, 2, preco_unitario FROM cardapio WHERE nome = 'Latte';

-- Comanda 3 (Carla): Americano (1), Mocha (1), Latte (1)
INSERT INTO item_comanda (id_comanda, id_cafe, quantidade, preco_unitario)
SELECT 3, id_cafe, 1, preco_unitario FROM cardapio WHERE nome = 'Americano';

INSERT INTO item_comanda (id_comanda, id_cafe, quantidade, preco_unitario)
SELECT 3, id_cafe, 1, preco_unitario FROM cardapio WHERE nome = 'Mocha';

INSERT INTO item_comanda (id_comanda, id_cafe, quantidade, preco_unitario)
SELECT 3, id_cafe, 1, preco_unitario FROM cardapio WHERE nome = 'Latte';

-- Comanda 4 (Diego): Expresso (3 un)
INSERT INTO item_comanda (id_comanda, id_cafe, quantidade, preco_unitario)
SELECT 4, id_cafe, 3, preco_unitario FROM cardapio WHERE nome = 'Expresso';
