Rails.application.routes.draw do
  resources :inventories, only: [:index, :show, :create, :destroy]
  resources :inventory_items, only: [:update]

  resources :products
  resources :import_products, only: [:new, :create]
  resources :product_units, only: [:destroy]

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index]
      resources :scans, only: [:create]
    end
  end

  root to: 'inventories#index'
end
