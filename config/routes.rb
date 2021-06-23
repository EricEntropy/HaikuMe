Rails.application.routes.draw do
  resources :haikus
  resources :themes
  resources :users


  # root 'application#home'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
