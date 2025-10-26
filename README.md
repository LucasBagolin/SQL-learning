# Atividade 08 — Cafeteria BomGosto

Projeto SQL em **PostgreSQL** para modelar e consultar dados de uma cafeteria.

## Tabelas
- **cardapio**: cafés (`id_cafe`, `nome` único, `preco_unitario`)
- **comanda**: pedidos (`id_comanda`, `data_hora`, `mesa`, `cliente`)
- **item_comanda**: itens da comanda (`id_comanda`, `id_cafe`, `quantidade`, `preco_unitario`)
  - `UNIQUE(id_comanda, id_cafe)` → impede repetição do mesmo café  
  - `ON DELETE CASCADE` → apaga itens ao excluir a comanda  

## Execução
1. Criar banco `cafeteria_bomgosto` no **pgAdmin**  
2. Rodar:
   - `schema.sql`
   - `seed.sql`
   - `consultas.sql`

## Consultas
1. Cardápio ordenado por nome  
2. Comandas + itens + total por item  
3. Total de cada comanda  
4. Comandas com mais de um tipo de café  
5. Faturamento total por data  

## Exemplo
| Cliente | Itens | Total |
|----------|--------|--------|
| Ana | Expresso + Cappuccino | 16.00 |
| Bruno | 2× Latte | 19.00 |
| Carla | Americano + Mocha + Latte | 28.50 |
| Diego | 3× Expresso | 18.00 |

**Faturamento:**  
2025-10-25 → R$ 35,00  
2025-10-26 → R$ 46,50  

## Licença
MIT
