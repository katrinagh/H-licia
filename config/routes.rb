Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # root "articles#index"
  resources :stores do
    resources :articles
  end

  resources :users do
    resources :orders
    resources :article_orders
  end
end
