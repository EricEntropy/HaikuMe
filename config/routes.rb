Rails.application.routes.draw do
  root 'application#home'
  resources :haikus
  resources :themes
  resources :users do 
    resources :haikus, only: [:new, :show, :edit, :index, :update, :destroy]
  end 
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get "/auth/github/callback", to: "sessions#create_through_github"
  match '/auth/:provider/callback', to: 'auth#callback', via: [:get, :post]
end
