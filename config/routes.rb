Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root 'welcome#index'

  get '/rounds/public', to: 'rounds#public_show'
  
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  # post '/logout', to: 'users#logout'

  get '/users/dashboard', to: 'users#show'

  get '/rounds/votes/index', to: 'rounds/votes#index'

  
end
