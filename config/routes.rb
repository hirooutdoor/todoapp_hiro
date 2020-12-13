Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'
  resources :boards do
    resources :tasks, only: [:show, :new, :edit, :update, :create, :delete]
  end
  resource :profile, only: [:show, :edit, :update]
end
  