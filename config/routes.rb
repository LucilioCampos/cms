Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
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
