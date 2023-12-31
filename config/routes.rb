Rails.application.routes.draw do
  devise_for :users
  
  root "categories#index"
  resources :category_purchases
  resources :purchases
  resources :categories
  resources :users

  get 'budget_wiz', to: 'splash#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
