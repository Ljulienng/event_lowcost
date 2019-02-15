Rails.application.routes.draw do

  resources :events do
  	resources :attendances
  	resources :charges
  end
  namespace :admins do
    resources :admin, only: [:index]
    resources :users
    resources :attendances
    resources :events
    root to: "admin#index"
  end
	root 'events#index'
  get 'home/index'
  get 'home/secret'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
