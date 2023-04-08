module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: [:show, :update, :destroy]

      def index
        @movies = Movie.all
        apply_filters
        render json: @movies.order(:year).as_json(except: [:created_at, :updated_at])
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
      end
    end
  end
end
