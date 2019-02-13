Rails.application.routes.draw do
  resources :events do
  	resources :attendances
  end
	root 'events#index'
  get 'home/index'
  get 'home/secret'
  devise_for :users
  resources :users
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
