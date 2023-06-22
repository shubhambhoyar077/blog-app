Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:show, :edit, :update] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end
  resources :posts, only: [:destroy]
  resources :comments, only: [:destroy]

  namespace :api do
    resources :users, only: [] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index]
      end
    end
    resources :posts, only: [] do
      resources :comments, only: [:new, :create]
    end
  end

end
