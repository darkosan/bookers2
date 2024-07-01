Rails.application.routes.draw do

  root to: "home#top"
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :users_index]

  get 'home/about' => 'home#about', as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
