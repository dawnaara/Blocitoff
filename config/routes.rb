Rails.application.routes.draw do
 
  devise_for :users

  resources :users, only: [:show] do
  	resources :items, only: [:create, :destroy] do
  		member do
  			delete :destroy
  		end
  	end
  end

  root to: 'welcome#index'
end
