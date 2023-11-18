Rails.application.routes.draw do

  root 'users#signin'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login', as: 'login'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create', as: 'create_user'
  get '/user/:id', to: 'users#show', as: 'user'
  delete '/signout', to: 'users#signout'
  delete '/user/:id', to: 'users#destroy'

  resources :users
  resources :game_histories, only: [:show]
  resources :auto_drop_deads
  get 'game_history/redirect_to_game', to: 'game_histories#redirect_to_game', as: 'redirect_to_game'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "application#hello"
end
