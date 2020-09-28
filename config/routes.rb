Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :dances, only: [:index, :new, :create]
end
