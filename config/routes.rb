Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root :to => 'users#index'
  get '/' => 'users#index'
  post '/sessions/' =>'sessions#create'
  post '/users' => 'users#create'
  get '/dashboard' => 'movies#search_form"'
  delete '/sessions' => 'sessions#destroy' 
  get '/users/new' => 'users#new'
  get "/search/" => "movies#search_form"
  get "/search/movie" => "movies#popular"
  get "/search/results" =>"movies#search_results"
  get "/movie/:id" => "movies#show"
  post "/user/movies/:id/add_favourite" => "movies#add_favourite"
  get "/user/favourite" => "movies#show_fav" 
  delete '/movie/:id/delete' => 'movies#destroy' 
  
end
