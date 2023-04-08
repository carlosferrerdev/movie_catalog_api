require 'csv'

class MovieImporter
  def self.import(file_path)
    # Lê o arquivo CSV e itera pelas linhas
    CSV.foreach(file_path, headers: true) do |row|
      # Cria um novo registro de filme com base na linha CSV
      movie = Movie.new(
        show_id: row['show_id'],
        title: row['title'],
        genre: row['type'],
        year: row['release_year'],
        country: row['country'],
        published_at: row['date_added'],
        description: row['description']
      )

      # Salva o registro de filme no banco de dados
      movie.save!
    end
  end
end
