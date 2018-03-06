Rails.application.routes.draw do
  resources :inventories
  resources :product_units
  resources :products

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index]
      resources :scans, only: [:create]
    end
  end

  root to: 'inventories#index'
end
