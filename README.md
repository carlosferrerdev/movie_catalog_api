<h1>Movie Catalog API</h1>
<p>Uma API de Filmes - Uma API RESTful para gerenciamento de informações de filmes.</p>
<p>A API lê os dados de um arquivo no formato CSV, importa todas as informações para um banco de dados, processa as informações e disponibiliza os dados em um arquivo JSON.</p>
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
      <td>Title</td>
      <td>String</td>
      <td>Filtra as obras pelo título da obra</td>
    </tr>
    <tr>
      <td>year</td>
      <td>Integer</td>
      <td>Filtra as obras pelo ano de lançamento</td>
    </tr>
    <tr>
      <td>genre</td>
      <td>String</td>
      <td>Filtra as obras pelo gênero</td>
    </tr>
    <tr>
      <td>country</td>
      <td>String</td>
      <td>Filtra as obras pelo país de origem</td>
    </tr>
    <tr>
      <td>description</td>
      <td>String</td>
      <td>Filtra as obras por sua descrição</td>
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
    "id": "0bb32f97-c94d-410e-9949-9050603ee1b9",
    "title": "14 Blades",
    "genre": "Movie",
    "year": 2010,
    "country": "Hong Kong, China, Singapore",
    "published_at": "2019-04-03",
    "description": "In the age of the Ming Dynasty, Quinglong is the best of the Jinyiwei, an elite assassin squad made up of highly trained former street urchins. When evil eunuch Jia unseats the emperor, Quinglong is called to action but is quickly betrayed."
  },
  {
    "id": "2a7b4eb4-c7ae-497a-b492-4c326541b53d",
    "title": "21 & Over",
    "genre": "Movie",
    "year": 2013,
    "country": "United States",
    "published_at": "2019-04-16",
    "description": "Jeff's straight-and-narrow life changes abruptly when his buddies take him out for a birthday bash – the night before a crucial med school interview."
  }
]
</pre>
<p>Exemplo de uso</p>
<p>Requisição</p>
<pre>
GET /api/v1/movies?year=2013&genre=Movie&country=United%20States
</pre>
<p>Resposta</p>
<pre>
[
  {
    "id": "4b9f60c2-ad71-4662-b278-4fc3bde9f44b",
    "title": "20 Feet From Stardom",
    "genre": "Movie",
    "year": 2013,
    "country": "United States",
    "published_at": "2018-09-22",
    "description": "Winner of the 2014 Academy Award for Best Documentary Feature, this film takes a look at the world of backup vocalists and the legends they support."
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
<h2>Documentação da API</h2>
Gerada no Postman.
<i>https://documenter.getpostman.com/view/16315917/2s93XsYRf4</i>
