Rails.application.routes.draw do
root "products#index"

get '/products/:id/buy', to: 'products#buy', as: 'Buy'
get '/cart', to: 'products#cart', as: 'Cart'
get '/checkout', to: 'products#checkout', as: 'Checkout'

resources :products, path: '/products'
resources :comments, only: [:show, :new, :update]

get '/products.json', to:'products#json', as: 'json'
  
end
