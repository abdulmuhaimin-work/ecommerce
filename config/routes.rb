Rails.application.routes.draw do
  # get 'order_items/create'
  #
  # get 'order_items/update'
  #
  # get 'order_items/destroy'
  #
  # get 'carts/show'
  #
  # get 'products/index'
  #
  # root to: 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'landing#index'
  get :about, to: 'static_pages#about'
  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: 'landing#index'

end
