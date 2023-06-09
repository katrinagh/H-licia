Rails.application.routes.draw do
  devise_for :users

  root to: 'stores#index'

  resources :orders, only: %i[show destroy]

  resources :article_orders, only: %i[create destroy show]
  post 'article_orders/:id/add' => 'article_orders#add_quantity', as: 'article_order_add'
  post 'article_orders/:id/reduce' => 'article_orders#reduce_quantity', as: 'article_order_reduce'

  resources :articles, only: %i[index new]
  resources :confirmed_orders, only: %i[index show new create]

  resources :stores, only: %i[index show]
end
