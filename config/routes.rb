Rails.application.routes.draw do
  get 'image/new'
  get 'users/show'
  get 'users/edit'
  get 'users/new'
  root to: 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :blogs
end
