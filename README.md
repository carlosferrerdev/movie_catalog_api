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
<h3>Endpoint: Importar filmes de um arquivo CSV</h3>
<p><strong>Descrição:</strong> Este endpoint permite importar filmes de um arquivo CSV para a base de dados do catálogo de filmes.</p>
<p><strong>Método HTTP:</strong> POST</p>
<p><strong>URL:</strong> /api/v1/movies/import</p>
<h4>Parâmetros</h4>
<table>
    <tr>
        <th>Nome</th>
        <th>Tipo</th>
        <th>Descrição</th>
        <th>Obrigatório</th>
    </tr>
    <tr>
        <td>file</td>
        <td>File</td>
        <td>Arquivo CSV contendo os dados dos filmes</td>
        <td>Sim</td>
    </tr>
</table>
<h4>Formato do arquivo CSV</h4>
<p>O arquivo CSV deve ter as seguintes colunas:</p>
<ul>
    <li><code>title</code>: Título do filme (string)</li>
    <li><code>genre</code>: Gênero do filme (string)</li>
    <li><code>year</code>: Ano de lançamento do filme (integer)</li>
    <li><code>country</code>: País de origem do filme (string)</li>
    <li><code>published_at</code>: Data de publicação do filme (string, formato: AAAA-MM-DD)</li>
    <li><code>description</code>: Descrição do filme (string)</li>
</ul>
<h4>Resposta</h4>
<h5>Em caso de sucesso:</h5>
<p><strong>Código HTTP:</strong> 201 Created</p>
<p><strong>Exemplo de corpo da resposta:</strong></p>
<pre>
{
  "message": "Filmes importados com sucesso"
}
</pre>
<h5>Em caso de falha (por exemplo, arquivo não fornecido):</h5>
<p><strong>Código HTTP:</strong> 422 Unprocessable Entity</p>
<p><strong>Exemplo de corpo da resposta:</strong></p>
<pre>
{
  "message": "Arquivo não fornecido"
}
</pre>
<h4>Exemplo de uso</h4>
<h5>Usando cURL:</h5>
<pre>
curl -X POST -H "Content-Type: multipart/form-data" -F "file=@/path/to/your/csv/file.csv" http://localhost:3000/api/v1/movies/import
</pre>
<h5>Usando Postman:</h5>
<ol>
    <li>Selecione o método POST.</li>
    <li>Insira a URL <code>http://localhost:3000/api/v1/movies/import</code>.</li>
    <li>Selecione a aba "Body".</li>
    <li>Escolha a opção "form-data".</li>
    <li>Insira a chave <code>file</code>, selecione o tipo "File" e escolha o arquivo CSV</li>
    <li>Envie a solicitação clicando no botão "Send".</li>
</ol>
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
      <td>title</td>
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
<pRequisição</p>

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
rails db:create db:migrate
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
<p>Gerada no Postman.</p>
<i>https://documenter.getpostman.com/view/16315917/2s93Xu15Pi</i>
