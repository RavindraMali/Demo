Rails.application.routes.draw do
  
  # root 'article#index'
  root to: "articles#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/contactus', to: "contacts#index" 
  # get '/aboutus', to: "abouts#index"
  resources:products
  post '/products/search', to: 'products#search', as: 'products_search'

  resources:addresses
  
  resources:carts

  resources:orders
  
  get '/page/:slug', to: 'pages#page'
  
end
