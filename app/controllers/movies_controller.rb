class MoviesController < ApplicationController
  before_action :check_if_logged_in 
    API_KEY = '24d863d54c86392e6e1df55b9a328755'
    API_BASE_URL = 'https://api.themoviedb.org/3'
  def search_form
    @logged_user= session[:user_id]
    discover_url = "#{ API_BASE_URL }/discover/movie?certification_country=US&certification=R&sort_by=revenue.desc&with_cast=3896&api_key=#{ API_KEY }"
    @discover = HTTParty.get(discover_url)
    @movie_titles = @discover['results']
    @movie_discover = []
    @movie_titles.each do |movie| 
      @movie_discover.push(movie)
    end
    popular = "#{ API_BASE_URL }/discover/movie?sort_by=popularity.desc&api_key=#{ API_KEY }"
    @most_popular = HTTParty.get(popular)
    @most_popular_movies = @most_popular['results']
    @popular_movies = []
    @most_popular_movies.each do |popular| 
      @popular_movies.push(popular)
    end
    drama = "#{ API_BASE_URL }/discover/movie?with_genres=18&sort_by=vote_average.desc&vote_count.gte=10&api_key=#{ API_KEY }"
    @movie_drama = HTTParty.get(drama)
    @movie_drama_best = @movie_drama['results']
    @top_rated_movie_drama = []
    @movie_drama_best.each do |top| 
      @top_rated_movie_drama.push(top)
    end
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
    discover_url = "#{ API_BASE_URL }/discover/movie?certification_country=US&certification=R&sort_by=revenue.desc&with_cast=3896&api_key=#{ API_KEY }"
    @discover = HTTParty.get(discover_url)
    @discover_movie = JSON.parse(@discover.body)['results']
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
    @titles = []
    @favorate_ids.each do |id|
      movie_url = "#{ API_BASE_URL }/movie/#{id}?api_key=#{ API_KEY }"
      movie = HTTParty.get(movie_url)
      title = JSON.parse(movie.body)['title']
      @titles.push(title)
      # {title: title, movie_id: id}
    end 
  end

  def destroy 
    @movie = MovieUser.find_by :movie_id => params[:id]
    @movie.destroy 
    redirect_to'/user/favourite'
  end
end
