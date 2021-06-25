Rails.application.routes.draw do
  root 'application#home'
  resources :haikus
  resources :themes
  resources :users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
