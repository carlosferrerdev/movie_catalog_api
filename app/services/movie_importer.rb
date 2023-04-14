require 'csv'

class MovieImporter
  def self.import(file)
    # Inicializa o contador de filmes importados e ignorados
    imported_count = 0
    ignored_count = 0

    # Lê o arquivo CSV e itera pelas linhas
    CSV.new(file.read, headers: true).each do |row|
      # Cria um novo registro de filme com base na linha CSV
      movie = Movie.new(
        title: row['title'],
        genre: row['type'],
        year: row['release_year'],
        country: row['country'],
        published_at: row['date_added'],
        description: row['description']
      )

      # Verifica se o filme já existe no banco de dados
      existing_movie = Movie.find_by(title: movie.title, year: movie.year)

      if existing_movie.nil?
        # Salva o registro de filme no banco de dados
        if movie.save
          # Incrementa o contador de filmes importados
          imported_count += 1
        end
      else
        # Incrementa o contador de filmes ignorados
        ignored_count += 1
      end
    end

    # Retorna uma mensagem com a contagem de filmes importados e ignorados
    "Filmes importados: #{imported_count}, Filmes ignorados (duplicados): #{ignored_count}"
  end
end
