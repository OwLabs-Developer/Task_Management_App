Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users , only: [:new, :create]

  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  resources :tasks
  resources :categories
  resources :dashboards
  resources :notifications

  root 'dashboards#landing_page'
end
