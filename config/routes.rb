Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  resources :users, only: [:show]  
  	resources :items, only: [:create]

  root to: 'welcome#index'
end
