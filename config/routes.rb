Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
  
  unauthenticated :user do
    root 'home#index', as: :unauthenticated_root
  end
  
  resources :users
  resources :categories, only: [:index, :show, :new, :create] do
    resources :transactions, only: [:new, :create]
  end
end
