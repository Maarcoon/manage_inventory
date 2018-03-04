Rails.application.routes.draw do
  resources :inventories
  resources :product_units
  resources :products

  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
