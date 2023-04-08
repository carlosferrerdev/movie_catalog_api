class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  def index
    @movies = Movie.all
    @movies = @movies.where('year = ?', params[:year]) if params[:year]
    @movies = @movies.where('genre ILIKE ?', "%#{params[:genre]}%") if params[:genre]
    @movies = @movies.where('country ILIKE ?', "%#{params[:country]}%") if params[:country]
    render json: @movies.order(:year)
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
    params.require(:movie).permit(:id, :title, :genre, :year, :country, :published_at, :description)
  end
end
