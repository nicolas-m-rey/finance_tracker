Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root 'home#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stock#search'

  
end
