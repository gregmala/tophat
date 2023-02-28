Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users, only: [:show]
  resources :products do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index] do
    member do
      patch 'accept'
      patch 'decline'
    end
  end
end
