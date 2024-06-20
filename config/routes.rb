Rails.application.routes.draw do
  
  devise_for :users
  
  get 'users/show'
  get 'users/edit'
  get 'books/new'
  get 'books/create'
  get 'books/index'
  get 'books/show'
  get 'homes/about' => 'homes#about', as: "about"
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
