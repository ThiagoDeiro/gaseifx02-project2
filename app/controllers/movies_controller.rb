class MoviesController < ApplicationController
    API_KEY = '24d863d54c86392e6e1df55b9a328755'
    API_BASE_URL = 'https://api.themoviedb.org/3'
  def search_form
    @logged_user= session[:user_id]
    url = "#{ API_BASE_URL }/discover/movie?certification_country=US&certification=R&sort_by=revenue.desc&with_cast=3896&api_key=#{ API_KEY }"
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
    url = "#{ API_BASE_URL }/discover/movie?certification_country=US&certification=R&sort_by=revenue.desc&with_cast=3896&api_key=#{ API_KEY }"
    @movie = HTTParty.get(url)
  end

  def add_favourite
    @user = User.find_by :id => session[:user_id]
    @movie_id = params[:id].to_i
    movieuser = MoviesUser.new
    movieuser.user_id = @user.id
    movieuser.movie_id = @movie_id
    movieuser.save
    redirect_to'/movie/'+ @movie_id.to_s
    # raise "hell"
  end
  def show_fav 
    @user = User.find_by :id => session[:user_id]
    @favorate_ids = @user.movies_users
    @favorate_ids = @favorate_ids.map{ |obj| obj.movie_id }
    @favorate_ids = @favorate_ids.uniq
    movie_id = @favorate_ids.first
    @titles = []
    @favorate_ids.each do |id|
      movie_url = "#{ API_BASE_URL }/movie/#{id}?api_key=#{ API_KEY }"
      movie = HTTParty.get(movie_url)
      title = JSON.parse(movie.body)['title']
      @titles.push(title)
    end
    
  end
end
