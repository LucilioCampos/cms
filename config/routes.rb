Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'root#index'
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :kinds
      resources :phones
      resources :clients
      resources :addresses
      resources :documents
      resources :products
      resources :discounts
      resources :sales
      resources :product_quantities
      resources :sale_products
    end
  end
end
