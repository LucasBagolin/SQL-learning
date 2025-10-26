-- Tabela de cafés (cardápio)
CREATE TABLE IF NOT EXISTS cardapio (
  id_cafe        SERIAL PRIMARY KEY,
  nome           VARCHAR(80) NOT NULL UNIQUE,
  descricao      TEXT,
  preco_unitario NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0)
);

-- Tabela de comandas
CREATE TABLE IF NOT EXISTS comanda (
  id_comanda  SERIAL PRIMARY KEY,
  data_hora   TIMESTAMP NOT NULL DEFAULT NOW(),
  mesa        INTEGER   NOT NULL CHECK (mesa > 0),
  cliente     VARCHAR(120) NOT NULL
);

-- útil para as consultas que ordenam por data
CREATE INDEX IF NOT EXISTS idx_comanda_data ON comanda (data_hora);

-- Itens da comanda
CREATE TABLE IF NOT EXISTS item_comanda (
  id_item        SERIAL PRIMARY KEY,
  id_comanda     INTEGER NOT NULL REFERENCES comanda(id_comanda) ON DELETE CASCADE,
  id_cafe        INTEGER NOT NULL REFERENCES cardapio(id_cafe),
  quantidade     INTEGER NOT NULL CHECK (quantidade > 0),
  preco_unitario NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0),

  -- Regra: não repetir o mesmo café dentro da mesma comanda
  CONSTRAINT uq_item_por_cafe UNIQUE (id_comanda, id_cafe)
);

