# Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"


#   resources :notifications, only: [:show, :update] do
#     collection do
#       put :read_all
#     end
#   end
# end

#   resources :users

#   resources :sessions, only: [:new, :create, :destroy]
#   get 'logout', to: 'sessions#destroy'
  
#   resources :tasks
#   resources :categories
#   resources :dashboards
#   resources :notifications
  

#   root 'dashboards#landing_page'
# end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # constraints host: 'owlabs.online' do
    root 'dashboards#landing_page'

    resources :users do
      member do
        get 'verify_email_user', to: 'users#verify_email', as: 'verify_email'
      end
    end
    
    resources :sessions, only: [:new, :create, :destroy] do
      member do
        get :verify_email
        post :resend_verification_email
      end
    end

    get 'logout', to: 'sessions#destroy'
    resources :tasks
    resources :categories

    resources :dashboards
    get '/about', to: 'dashboards#about'
    get '/features', to: 'dashboards#features'
    get '/pricing', to: 'dashboards#pricing'

    resources :notifications, only: [:show, :update] do
      collection do
        put :read_all
      end
    end

    # Custom route for verify_email in SessionsController
    get '/sessions/:token/verify_email/:username', to: 'sessions#verify_email', as: :verify_email_session_custom
  end
# end


  


  
  

