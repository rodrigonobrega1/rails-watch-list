class MoviesController < ApplicationController
    before_action :set_movies, only: [:show, :edit, :update, :destroy]

    def index
        @movies = Movie.all
    end

    def show; end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.new(movies_params)
    @movies.save

    redirect_to movies_path(@movies)
  end

  def edit; end

  def update
    @movies.update(movies_params)

    redirect_to movies_path(@movies)
  end

  def destroy
    @movies.destroy

    redirect_to movies_path
  end

  private

  def set_movies
    @movies = Movie.find(params[:id])
  end

  def movies_params
    params.require(:movies).permit(:title, :overview, :poster_url, :rating)
  end
end
