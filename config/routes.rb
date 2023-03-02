Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users, only: [:show]


  resources :products, only: [:new , :create]

  resources :products, only: [:show] do
    resources :bookings , only: [:new , :create]
  end

<<<<<<< Updated upstream
<<<<<<< Updated upstream
  resources :products, only: [:index,:destroy] do
    collection do
      get "/category/:category(/:size)(/:color)(/:brand)", to: 'products#filter', as: 'filter'
=======
  resources :products, only: [:index] do
    collection do
      get "/category/:category/filters", to: 'products#filter', as: 'filter'
>>>>>>> Stashed changes
=======
  resources :products, only: [:index] do
    collection do
      get "/category/:category/filters", to: 'products#filter', as: 'filter'
>>>>>>> Stashed changes
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
