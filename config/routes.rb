Rails.application.routes.draw do
  root "products#index"
resources :products, path: '/products'
resources :comments, only: [:show, :new, :edit, :create]
get '/products.json', to:'products#json', as: 'json'
end
