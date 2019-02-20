Rails.application.routes.draw do

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end



  resources :events do
  	resources :attendances
  	resources :charges
    resources :images, only: [:create, :new]
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
