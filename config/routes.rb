Rails.application.routes.draw do
  root 'application#home'
  resources :haikus
  resources :themes
  resources :users do 
    resources :haikus, only: [:new, :show, :edit, :index]
  end 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
