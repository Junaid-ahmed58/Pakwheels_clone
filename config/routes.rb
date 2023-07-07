Rails.application.routes.draw do
  devise_for :users
  resources :cars
  get 'cars/step2/:id', to: 'cars#step2', as: 'car_step2'
  patch 'cars/step2/:id', to: 'cars#step2_update'
  get 'cars/step3/:id', to: 'cars#step3', as: 'car_step3'
  patch 'cars/step3/:id', to: 'cars#step3_update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
