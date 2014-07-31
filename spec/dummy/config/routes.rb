Rails.application.routes.draw do

  devise_for :users
  mount Scream::Engine => "/scream"
end
