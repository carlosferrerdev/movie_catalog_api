class MovieImporter
  def self.import(file)
    begin
      imported_count = 0
      ignored_count = 0

      CSV.new(file.read, headers: true).each do |row|
        movie = Movie.new(
          title: row['title'],
          genre: row['type'],
          year: row['release_year'],
          country: row['country'],
          published_at: row['date_added'],
          description: row['description']
        )

        existing_movie = Movie.find_by(title: movie.title, year: movie.year)

        if existing_movie.nil?
          if movie.save
            imported_count += 1
          else
            # Se houver um erro ao salvar o filme, incrementa o contador de erro e continua a próxima iteração
            ignored_count += 1
          end
        else
          ignored_count += 1
        end
      end

      "Filmes importados: #{imported_count}, Filmes ignorados (duplicados): #{ignored_count}"

    rescue StandardError => e
      # Se ocorrer um erro, retorna uma string contendo a mensagem de erro
      "Erro na importação: #{e.message}"
    end
  end
end
