Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'
  resources :boards do
    resources :tasks, only: [:show, :new, :edit, :update, :create, :destroy] do
      resources :comments, only: [:new, :create]
    end
  end
  resource :profile, only: [:show, :edit, :update]
end
  