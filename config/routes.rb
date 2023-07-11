Rails.application.routes.draw do
  devise_for :users
  resources :cars
  get 'cars/image/:id', to: 'cars#image', as: 'car_image'
  patch 'cars/image/:id', to: 'cars#image_update'
  get 'cars/description/:id', to: 'cars#description', as: 'car_description'
  patch 'cars/description/:id', to: 'cars#description_update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cars#index"
end
