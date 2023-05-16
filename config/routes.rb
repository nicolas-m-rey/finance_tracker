Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  # resources :users, only: [:show]
  resources :friendships, only: [:create, :destroy]

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'home#index'
  get 'home/index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stock#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friend', to: 'users#search'
  get 'users/:id', to: 'users#show', as: 'user'

  
end
