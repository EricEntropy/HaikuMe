Rails.application.routes.draw do
  root 'application#home'
  resources :haikus
  resources :themes
  resources :users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  # root 'application#home'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
