class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    Movie.create!(movie_params.merge(params[:movie].merge(:genres => Genre.find(params[:genres]))))
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:genres)  
  end
end
