# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require_relative '../app/services/movie_importer'

def import_movies_from_file(file_path)
  puts "Importing movies from #{file_path}"

  MovieImporter.import(file_path)

  puts "Movies imported successfully!"
end

# Example usage:
import_movies_from_file(Rails.root.join('db', 'netflix_titles.csv'))
