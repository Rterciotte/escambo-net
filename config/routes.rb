Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :user_profiles
  end
  root to: 'home#index'
end
