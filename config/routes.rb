Rails.application.routes.draw do
  resources :events
	root 'events#index'
  get 'home/index'
  get 'home/secret'
  devise_for :users
  resources :users
  resources :charges
  resources :attendances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
