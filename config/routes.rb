require 'sidekiq/web'
Scream::Engine.routes.draw do
  resources :iframe_contents
  resources :contents do
    member do
      get 'details'
    end
    collection do
      get 'tags'      
    end
  end
    
  root 'contents#index'
  mount Sidekiq::Web, at:'/sidekiq'
end