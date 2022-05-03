Rails.application.routes.draw do

root "home#index"

get 'products/index', to: 'products#index', as: 'listed'
get '/products/:id/buy', to: 'products#buy', as: 'buy'
get '/cart', to: 'products#cart', as: 'cart'
get '/checkout', to: 'products#checkout', as: 'checkout'

resources :products, path: '/products'
resources :comments, only: [:show, :new, :update]

get '/products.json', to:'products#json', as: 'json'
  
end
