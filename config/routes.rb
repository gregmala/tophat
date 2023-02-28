Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :users, only: [:show]
  resources :products,  only: [:show] do
    resources :bookings , only: [:new , :create]
  end
  resources :products, only: [:index] do
    collection do
      get "/category/:category/filters/:array", to: 'products#filter', as: 'filter'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
