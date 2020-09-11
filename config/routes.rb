Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    get 'search', on: :collection
  end
  resources :ads do
    get 'search', on: :collection
    put 'buy', on: :collection
    put 'sell', on: :collection
    put 'cancel', on: :collection
  end  
  root to: 'home#index'
end
