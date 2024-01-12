Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  root to: 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end
end
