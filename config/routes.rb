Rails.application.routes.draw do

  resources :shares do
    resources :comments
    resources :votes, only: [:show, :update, :create], shallow: true
  end

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :shares, only: [:index], action: :user_shares
    resources :comments, only: [:index], action: :user_comments
    get '/edit/password', action: :edit_password, as: :edit_password
    patch '/password', action: :update_password, as: :update_password
  end

  root 'shares#index'
  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
