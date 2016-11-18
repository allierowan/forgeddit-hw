Rails.application.routes.draw do

  resources :shares do
    resources :comments
  end

  resources :users, only: [:new, :create] do
    resources :shares, only: [:index], action: :user_shares
    resources :comments, only: [:index], action: :user_comments
  end

  root 'users#new'
  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
