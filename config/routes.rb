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
  resources :auto_drop_deads do
    member do
      post 'replay'
    end
  end
  get 'game_history/redirect_to_game', to: 'game_histories#redirect_to_game', as: 'redirect_to_game'
  get 'auto_drop_deads/:id/show_game', to: 'auto_drop_deads#show_game', as: 'show_game_auto_drop_dead'
  get 'auto_drop_deads/:id/show_result', to: 'auto_drop_deads#show_result', as: 'show_result_auto_drop_dead'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "application#hello"
end
