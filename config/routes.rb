ails.application.routes.draw do
  devise_for :users

  root to: 'stores#index'

  resources :orders

  resources :article_orders, only: %i[create destroy show] do
    post 'add' => 'article_orders#add_quantity', as: 'article_order_add'
    post 'article_orders/:id/reduce' => 'article_orders#reduce_quantity', as: 'article_order_reduce'
    post 'add_to_cart/:article_id', action: :add_to_cart, as: :add_to_cart
    delete 'remove_from_cart/:id', action: :remove_from_cart, as: :remove_from_cart
  end

  resources :articles
  resources :confirmed_orders, only: %i[index show new create]
  resources :stores
end
