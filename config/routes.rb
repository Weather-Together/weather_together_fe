Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root 'welcome#index'

  get '/community_round', to: 'rounds#public_show'
  post '/community_round/submit', to: 'rounds#submit_vote'
  
  get '/users/new', to: 'users#new'
  get '/login', to: 'users#login_form'
  # post '/login', to: 'users#login'
  # post '/logout', to: 'users#logout'
  get '/users/dashboard', to: 'users#show'
  get '/verify_account/:user_id/:token', to: 'users#verify'

  # get '/rounds/votes/index', to: 'rounds/votes#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
end
