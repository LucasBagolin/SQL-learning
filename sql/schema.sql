-- Tabela de cafés (cardápio)
CREATE TABLE IF NOT EXISTS cardapio (
  id_cafe        SERIAL PRIMARY KEY,
  nome           VARCHAR(80) NOT NULL UNIQUE,
  descricao      TEXT,
  preco_unitario NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0)
);
