Rails.application.routes.draw do
  resources :users
  resources :auto_drop_deads
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#hello"
end
