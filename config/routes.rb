Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users do
    resources :ads do
      get 'search', on: :collection
    end
  end  
end
