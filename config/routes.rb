Rails.application.routes.draw do
  resources :posts
  get 'games/play'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#home'

  ## either do route definition the long way, or
    #   get '/passwords', to: 'passwords#index'
    #   post '/passwords', to: 'passwords#create'
    resources :passwords
    ## this defines all the routes at default places, eg the /passwords POST method calls the create method on the controller.
  # Defines the root path route ("/")
  # root "articles#index"
end
