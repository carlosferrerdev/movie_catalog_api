require 'csv'

class MovieImporter
  def self.import(file_path)
    CSV.foreach(file_path, headers: true, col_sep: ',') do |row|
      movie_params = row.to_h.symbolize_keys

      # Verifica se o filme já existe no banco de dados pelo ID
      movie = Movie.find_or_initialize_by(id: movie_params[:id])

      # Se o filme não existe, cria um novo registro
      if movie.nil?
        movie = Movie.new(movie_params)
        unless movie.save
        puts "Erro ao importar o filme #{movie.errors.full_messages}"
        end
      end
    end
  end
end
