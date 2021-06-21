Rails.application.routes.draw do
  get 'haiku_themes/new'
  get 'haiku_themes/create'
  get 'haiku_themes/edit'
  get 'haiku_themes/update'
  get 'haiku_themes/destroy'
  get 'haiku_themes/index'
  get 'haiku_themes/show'
  get 'themes/new'
  get 'themes/create'
  get 'themes/edit'
  get 'themes/update'
  get 'themes/destroy'
  get 'themes/index'
  get 'themes/show'
  get 'haikus/new'
  get 'haikus/create'
  get 'haikus/edit'
  get 'haikus/update'
  get 'haikus/destroy'
  get 'haikus/index'
  get 'haikus/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'users/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
