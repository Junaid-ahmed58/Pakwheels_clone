Rails.application.routes.draw do
  devise_for :users
  resources :cars do
  resources :likes, only: [:create, :destroy]
  resources :comments
    collection do
      get 'my_cars', to: 'cars#my_cars'
    end
  end
  resources :likes, only: [:create, :destroy]
  get 'cars/image/:id', to: 'cars#image', as: 'car_image'
  patch 'cars/image/:id', to: 'cars#image_update'
  get 'cars/description/:id', to: 'cars#description', as: 'car_description'
  patch 'cars/description/:id', to: 'cars#description_update'
  get 'search', to: 'search#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cars#index"
end
