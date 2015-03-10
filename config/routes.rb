Rails.application.routes.draw do
  root 'sessions#new'

  get :login, to: 'sessions#new', as: :login
  post :login, to: 'sessions#create', as: :new_login
  delete :logout, to: 'sessions#destroy', as: :logout

  resources :users, only: [:new, :create, :show]
  resources :tweets, only: [:index, :create]
end
