Rails.application.routes.draw do
  get 'orders/index'
  resources :orders, only: [:index]

  root 'orders#index'
end
