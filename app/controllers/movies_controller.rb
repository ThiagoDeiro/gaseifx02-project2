class MoviesController < ApplicationController
    API_KEY = '24d863d54c86392e6e1df55b9a328755'
    API_BASE_URL = 'https://api.themoviedb.org/3'
    # API_KEY = 'f44e65cd'
    # API_BASE_URL ='http://www.omdbapi.com/'
  def search_form
  end

  def index 
    @users = User.find_by :id => session[:user_id]
  end

  def search_results
    @query = params[ :query ]
    url = "#{ API_BASE_URL }/search/movie?api_key=#{ API_KEY }&query=#{ @query }"
    response = HTTParty.get( url )
    @results = response['results']
    # raise 'hell'
  end

  def show
    url = "#{ API_BASE_URL }/movie/#{ params[:id] }?api_key=#{ API_KEY }"
    @movie = HTTParty.get( url )
    redirect_to '/dashboard'
  end
end
