Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "users/registrations" }

  root 'tweets#index'

  resources :users, only: :show
  resources :tweets, only: [:index, :create]
end
