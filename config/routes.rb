Rails.application.routes.draw do

  devise_for :users, :path => '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup"}

  root 'home#index'
  get 'home/index'
  resources :walls
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :comments



end
