class MoviesController < ApplicationController
    # def index
    #     @movies = Movie.all
    # end
    # def search 
    #     @movie = Movie.find(movie_params)
    # end
    API_KEY = '24d863d54c86392e6e1df55b9a328755'
    API_BASE_URL = 'https://api.themoviedb.org/3'

  def search_form
  end

  def search_results
    @query = params[ :query ]
    url = "#{ API_BASE_URL }/search/movie?api_key=#{ API_KEY }&query=#{ @query }"
    response = HTTParty.get( url )
    @results = response['results']
   
  end

  def show
    url = "#{ API_BASE_URL }/movie/#{ params[:id] }?api_key=#{ API_KEY }"
    @movie = HTTParty.get( url )
    redirect_to '/dashboard'
  end
end
