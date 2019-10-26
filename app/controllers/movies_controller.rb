class MoviesController < ApplicationController
    API_KEY = '24d863d54c86392e6e1df55b9a328755'
    API_BASE_URL = 'https://api.themoviedb.org/3'
  def search_form
    @logged_user= session[:user_id]
    url = "#{ API_BASE_URL }/discover/movie?sort_by=popularity.desc&api_key=#{ API_KEY }"
    @movie = HTTParty.get(url)
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
    @movie = HTTParty.get(url)
    # raise "hell"
  end

  def popular 
    url = "#{ API_BASE_URL }/discover/movie?sort_by=popularity.desc&api_key=#{ API_KEY }"
    @movie = HTTParty.get(url)
  end
  # function to save de user and movie Id
  # def fav_save  
  #   @user = User.find_by session[:user_id]
  #   @user.movie_id = params[:movie_id]
  #   @user.save
  #   redirect_to'/search/results'
  #   raise "hell"
  # end
end
