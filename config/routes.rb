Rails.application.routes.draw do
  # get 'orders/index'
  # resources :orders, only: [:index]

  get '/orders/:country', to: 'orders#country', as: 'country'
  get "/search_result", to: "orders#search_result", as: :search_result
  root 'orders#index'

  # dealing with datepicker
  namespace :api do
    resources :items, only: [] do
      resources :click_tracks, only: [:create] do
        collection do
          get 'by_month'
        end
      end
    end
  end
end
