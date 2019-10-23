Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root :to => 'users#index'
  get '/' => 'users#index'
  post '/sessions/' =>'sessions#create'
  post '/users' => 'users#create'
  get '/dashboard' => 'movies#index'
  post '/dashboard/search' => 'movies#show'
  delete '/sessions' => 'sessions#destroy' 
  get '/users/new' => 'users#new'
end
