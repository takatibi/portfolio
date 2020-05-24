Rails.application.routes.draw do
  get 'image/new'
  get 'users/show'
  get 'users/edit'
  get 'users/new'
  get 'blogs/ranks'
  get 'search' => "search#search"
  root to: 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
     member do
      get :following, :follower
     end
  end
  resources :blogs do
  	resource :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy, :followings, :follower]
  resources :rooms, :only => [:create, :show, :index] do
    resources :messages, :only => [:create]
  end
  resources :notifications, :only => [:index, :destroy]
end
