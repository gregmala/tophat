Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users, only: [:show]


  resources :products, only: [:new , :create]

  resources :products, only: [:show] do
    resources :bookings , only: [:new , :create]
  end

  resources :products, only: [:index,:destroy] do
    collection do
      get "/category/:category/filters", to: 'products#filter', as: 'filter'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :bookings, only: [:index] do
    member do
      patch 'accept'
      patch 'decline'
    end
  end
end
