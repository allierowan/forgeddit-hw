Rails.application.routes.draw do

  resources :shares
  resources :users, only: [:new, :create]
  root 'users#new'
  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
