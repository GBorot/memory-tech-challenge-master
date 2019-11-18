Rails.application.routes.draw do
  # get 'orders/index'
  # resources :orders, only: [:index]

  get '/orders/:country', to: 'orders#country', as: 'country'
  root 'orders#index'
end
