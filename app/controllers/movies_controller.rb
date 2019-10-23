class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    def search 
        @movie = Movie.find(movie_params)
    end
end
