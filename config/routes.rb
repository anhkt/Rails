Rails.application.routes.draw do

  get "users/new"

  get "/signup", to: "users#new"

  post "signup", to: "users#create"

  get "/help", to: "static_pages#help", as: "help"

  get "/about", to: "static_pages#about", as: "about"

  get "/contact", to: "static_pages#contact", as: "contact"
  
  root "static_pages#home"

  resources :users
end

