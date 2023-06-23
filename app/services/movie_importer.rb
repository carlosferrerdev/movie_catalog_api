class MovieImporter
  def self.import(file)
    begin
      imported_count = 0
      ignored_count = 0
      errors = []

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
            errors << { title: movie.title, errors: movie.errors.full_messages }
          end
        else
          ignored_count += 1
          errors << { title: movie.title, error: "Movie already exists" }
        end
      end

      { message: "Filmes importados: #{imported_count}, Filmes ignorados (duplicados): #{ignored_count}", errors: errors }

    rescue StandardError => e
      # Se ocorrer um erro, retorna uma string contendo a mensagem de erro
      { message: "Erro na importação: #{e.message}", errors: errors }
    end
  end
end
