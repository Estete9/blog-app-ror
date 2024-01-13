Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'comments/index'
      get 'posts/user_posts'
    end
  end
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  root to: 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy, :index]
    resources :likes, only: [:create]
  end
end
