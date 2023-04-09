<h1>Movie Catalog API</h1>
<p>Uma API de Filmes - Uma API RESTful para gerenciamento de informações de filmes.</p>
<h2>Tecnologias utilizadas</h2>
<ul>
  <li>Ruby 3.2.0</li>
  <li>Ruby on Rails 7.0.4.3</li>
  <li>PostgreSQL 14.7</li>
</ul>

<h2>Recursos</h2>
<ul>
  <li>Listagem de filmes</li>
  <li>Filtragem de filmes por ano, gênero, país e data de publicação</li>
  <li>Ordenação de filmes por ano</li>
</ul>
<h2>Endpoints</h2>
<h3>Filmes</h3>
<p><strong>GET /api/v1/movies</strong></p>
<p>Recupera uma lista de filmes com suporte à filtragem e ordenação.</p>
<table>
  <thead>
    <tr>
      <th>Parâmetro</th>
      <th>Tipo</th>
      <th>Descrição</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>year</td>
      <td>Integer</td>
      <td>Filtra os filmes pelo ano de lançamento</td>
    </tr>
    <tr>
      <td>genre</td>
      <td>String</td>
      <td>Filtra os filmes pelo gênero</td>
    </tr>
    <tr>
      <td>country</td>
      <td>String</td>
      <td>Filtra os filmes pelo país de origem</td>
    </tr>
    <tr>
      <td>published_at</td>
      <td>Date</td>
      <td>Filtra os filmes pela data de publicação (YYYY-MM-DD)</td>
    </tr>
  </tbody>
</table>
<p>Resposta:</p>
<pre>
[
  {
    "id": "840c7cfc-cd1f-4094-9651-688457d97fa4",
    "title": "Star Wars - A New Hope",
    "genre": "Adventure",
    "year": 1977,
    "country": "United States",
    "published_at": "2015-01-01"
  },
  {
    "id": "840c7cfc-cd1f-4094-9651-88465d971hf9",
    "title": "The Godfather - Part II",
    "genre": "Drama",
    "year": 1975,
    "country": "United States",
    "published_at": "2023-04-09"
  }
]
</pre>
<p>Exemplo de uso</p>
<p>Requisição</p>
<pre>
GET /api/v1/movies?year=2001&genre=Fantasy&country=United%20States
</pre>
<p>Resposta</p>
<pre>
[
  {
    "id": "3fce0c80-df4a-4e33-bd2f-d18aa0b5a6c9",
    "title": "The Lord of the Rings: The Fellowship of the Ring",
    "genre": "Fantasy",
    "year": 2001,
    "country": "United States",
    "published_at": "2020-10-02"
  }
]
</pre>
<h2>Instalação</h2>
<p>Clone o repositório:</p>
<pre>
git clone https://github.com/carlosferrerdev/movie_catalog_api.git
</pre>
<p>Acesse o diretório do projeto:</p>
<pre>
cd movie_catalog_api
</pre>
<p>Instale as dependências:</p>
<pre>
bundle install
</pre>
<p>Configure o banco de dados:</p>
<pre>
rails db:create db:migrate db:seed
</pre>
<p>Inicie o servidor:</p>
<pre>
rails server
</pre>
<p>A API agora estará disponível em http://localhost:3000/api/v1/movies</p>
<h2>Testes</h2>
<p>Para executar os testes, use o seguinte comando:</p>
<pre>
bundle exec rspec
</pre>
