Rails.application.routes.draw do
  devise_for :users
  resources :ads
  root to: 'home#index'
end
