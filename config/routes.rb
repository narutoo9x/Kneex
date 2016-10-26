Rails.application.routes.draw do

  root 'home#index'

  get 'carts/index'
  post 'carts/confirm'

  get 'menu' => 'home#menu'

  get 'contact_us' => 'home#contact_us'
  resources :food_items
  resources :order_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
