# 🎬 Dashboard de Filmes com PostgreSQL, AWS Aurora e Power BI

## 📖 Sobre o projeto

Este projeto consiste na construção de um pipeline completo de análise de dados utilizando um banco de dados PostgreSQL hospedado no Amazon Aurora (AWS) e um dashboard desenvolvido no Microsoft Power BI.

O objetivo foi simular um ambiente de Business Intelligence (BI), desde a modelagem do banco de dados até a criação de visualizações para análise de informações sobre filmes, diretores, atores e plataformas de streaming.

---

# 📈 Dashboards

O projeto conta com dois dashboards desenvolvidos no Microsoft Power BI, ambos conectados diretamente ao banco de dados PostgreSQL hospedado no Amazon Aurora.

---

## Dashboard 1 — Visão Geral dos Filmes

Este dashboard apresenta uma visão consolidada do catálogo de filmes armazenado no banco de dados.

<img width="900" height="508" alt="Screenshot 2026-07-22 184652" src="https://github.com/user-attachments/assets/ce575c52-6098-4f96-b1dc-67cf37ae7e38" />


### Indicadores (KPIs)

- Quantidade total de filmes
- Média da duração dos filmes
- Média das notas IMDb
- Maior nota IMDb

### Recursos

- Filtro interativo por título
- Gráfico comparativo das notas IMDb por filme
- Gráfico comparativo da duração dos filmes
- Atualização dinâmica dos indicadores conforme o filtro selecionado

### Objetivo

Permitir uma análise rápida da qualidade e das características gerais do catálogo de filmes.

---

## Dashboard 2 — Streaming e Custos

Este dashboard concentra informações sobre as plataformas de streaming presentes no banco de dados e os filmes disponíveis em cada uma delas.

<img width="909" height="510" alt="Screenshot 2026-07-22 184741" src="https://github.com/user-attachments/assets/5a6a1e0f-af5d-4a21-bf1b-90c768cd593a" />


### Indicadores (KPIs)

- Quantidade de plataformas cadastradas
- Média dos preços das assinaturas
- Maior preço mensal
- Menor preço mensal

### Visualizações

- Gráfico de barras com o valor mensal de cada plataforma
- Gráfico de rosca mostrando a distribuição dos filmes por streaming
- Tabela detalhada contendo:
  - Filme
  - Ano de lançamento
  - Diretor
  - Ator principal
  - Plataforma de streaming
  - Valor mensal da assinatura

### Objetivo

Facilitar a análise comparativa entre plataformas de streaming, seus custos e os títulos disponíveis.

---

## Funcionalidades

- Conexão em tempo real com PostgreSQL (Amazon Aurora)
- Filtros interativos
- Indicadores (KPIs)
- Gráficos comparativos
- Tabelas dinâmicas
- Integração entre múltiplas tabelas utilizando relacionamentos SQL
- Visualização orientada para Business Intelligence

## 🏗️ Arquitetura

```text
CSV / SQL Scripts
        │
        ▼
Amazon Aurora PostgreSQL (AWS)
        │
        ▼
PostgreSQL (SQL)
        │
        ▼
Microsoft Power BI
        │
        ▼
Dashboard Interativo
```

---

# 🚀 Tecnologias utilizadas

- PostgreSQL
- Amazon Aurora (AWS RDS)
- Amazon EC2
- AWS Security Groups
- pgAdmin 4
- Microsoft Power BI
- SQL

---

# 📂 Estrutura do Banco de Dados

O banco foi modelado utilizando seis tabelas relacionadas.

## Diretores

Armazena informações dos diretores dos filmes.

| Campo | Tipo |
|--------|------|
| id_diretor | PK |
| nome | VARCHAR |
| nacionalidade | VARCHAR |
| data_nascimento | DATE |

---

## Filmes

Tabela principal do projeto.

Relaciona cada filme a um diretor.

| Campo | Tipo |
|--------|------|
| id_filme | PK |
| titulo | VARCHAR |
| ano_lancamento | INT |
| genero | VARCHAR |
| duracao_min | INT |
| nota_imdb | DECIMAL |
| id_diretor | FK |

---

## Atores

Cadastro dos atores.

| Campo | Tipo |
|--------|------|
| id_ator | PK |
| nome | VARCHAR |
| nacionalidade | VARCHAR |
| data_nascimento | DATE |

---

## Filme_Ator

Tabela de relacionamento N:N entre filmes e atores.

| Campo | Tipo |
|--------|------|
| id_filme | FK |
| id_ator | FK |
| personagem | VARCHAR |

---

## Streamings

Lista das plataformas de streaming.

| Campo | Tipo |
|--------|------|
| id_streaming | PK |
| nome | VARCHAR |
| preco_mensal | DECIMAL |

---

## Filme_Streaming

Relaciona quais plataformas disponibilizam cada filme.

| Campo | Tipo |
|--------|------|
| id_filme | FK |
| id_streaming | FK |

---

# 🔗 Relacionamentos

```text
Diretores
     │
     │ 1:N
     ▼
 Filmes
     │
     ├──────────────┐
     │              │
     │ N:N          │ N:N
     ▼              ▼
Atores       Streamings
```

---

# 📊 Consultas SQL

Algumas consultas utilizadas durante o desenvolvimento.

### Filmes e seus diretores

```sql
SELECT
    f.titulo,
    d.nome AS diretor
FROM filmes f
INNER JOIN diretores d
ON f.id_diretor = d.id_diretor;
```

### Filmes e atores

```sql
SELECT
    f.titulo,
    a.nome,
    fa.personagem
FROM filme_ator fa
INNER JOIN filmes f
ON fa.id_filme = f.id_filme
INNER JOIN atores a
ON fa.id_ator = a.id_ator;
```

### Filmes disponíveis em cada plataforma

```sql
SELECT
    f.titulo,
    s.nome
FROM filme_streaming fs
INNER JOIN filmes f
ON fs.id_filme = f.id_filme
INNER JOIN streamings s
ON fs.id_streaming = s.id_streaming;
```

---

# ☁️ Infraestrutura AWS

O banco de dados foi hospedado utilizando:

- Amazon Aurora PostgreSQL
- Amazon RDS
- Amazon EC2
- Security Groups para controle de acesso
- Conexão remota via pgAdmin

Durante o desenvolvimento também foram realizadas configurações de:

- Liberação da porta 5432
- Configuração de Security Groups
- Conexão remota ao banco
- Integração entre Aurora PostgreSQL e Power BI

---

# 📈 Dashboard

O dashboard foi desenvolvido utilizando o Microsoft Power BI, conectado diretamente ao banco PostgreSQL hospedado na AWS.

Entre as análises desenvolvidas estão:

- Quantidade de filmes por gênero
- Média de notas IMDb
- Filmes por diretor
- Filmes disponíveis por plataforma de streaming
- Distribuição por ano de lançamento
- Indicadores gerais do catálogo

---

# 🎯 Objetivos do projeto

- Modelagem relacional de banco de dados
- Prática de SQL
- Utilização de chaves primárias e estrangeiras
- Relacionamentos 1:N e N:N
- Hospedagem em ambiente cloud (AWS)
- Integração PostgreSQL + Power BI
- Construção de dashboards para Business Intelligence

---

# 📚 Aprendizados

Durante o projeto foram praticados conhecimentos sobre:

- SQL
- PostgreSQL
- Amazon Aurora
- Amazon RDS
- Segurança em banco de dados (Security Groups)
- Conexões remotas
- Business Intelligence
- Modelagem de dados
- Microsoft Power BI

---
