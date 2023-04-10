require 'csv'

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: [:show, :update, :destroy]

      def import
        if params[:file].present?
          filepath = params[:file].path
          CSV.foreach(filepath, headers: true) do |row|
            movie_attributes = row.to_hash.slice("title", "genre", "year", "country", "published_at", "description")
            Movie.create(movie_attributes)
          end
          render json: { message: "Filmes importados com sucesso" }, status: :created
        else
          render json: { message: "Arquivo não fornecido" }, status: :unprocessable_entity
        end
      end

      def index
        @movies = Movie.distinct
        apply_filters
        @movies = @movies.order(:year)
        render json: @movies.as_json(except: [:created_at, :updated_at])
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
        @movies = @movies.where('year = ?', params[:year]) if params[:year]
        @movies = @movies.where('genre ILIKE ?', "%#{params[:genre]}%") if params[:genre]
        @movies = @movies.where('country ILIKE ?', "%#{params[:country]}%") if params[:country]
        @movies = @movies.where('published_at = ?', params[:published_at]) if params[:published_at]
        @movies = @movies.where('title ILIKE ?', "%#{params[:title]}%") if params[:title]
        @movies = @movies.where('description ILIKE ?', "%#{params[:description]}%") if params[:description]
      end
    end
  end
end
