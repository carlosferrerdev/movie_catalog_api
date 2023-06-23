require 'csv'

module Api
  module V1
    class MoviesController < ApplicationController

      def import
        file = params[:file]
        if file.present?
          import_message = MovieImporter.import(file)
          render json: { message: 'Filmes importados com sucesso', import_message: import_message }, status: :created
        else
          render json: { message: 'Arquivo não fornecido' }, status: :unprocessable_entity
        end
      end

      def index
        @movies = Movie.distinct
        apply_filters
        @movies = @movies.order(:year)
        render json: @movies
      end

      def create
        @movie = Movie.new(movie_params)
        if @movie.save
          render json: @movie, status: :created, location: @movie
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_params
        params.require(:movie).permit(:title, :genre, :year, :country, :published_at, :description)
      end

      def apply_filters
        filters = %i[year genre country published_at title description]

        filters.each do |filter|
          if filter == :year || filter == :published_at
            @movies = @movies.where("#{filter} = ?", params[filter]) if params[filter]
          else
            @movies = @movies.where("#{filter} ILIKE ?", "%#{params[filter]}%") if params[filter]
          end
        end
      end
    end
  end
end
