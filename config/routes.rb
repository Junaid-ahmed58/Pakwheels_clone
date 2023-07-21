Rails.application.routes.draw do
  devise_for :users
  resources :cars do
  resources :likes, only: [:create, :destroy]
  resources :comments
    collection do
      get 'my_cars', to: 'cars#my_cars'
    end
  end
  get 'cars/image/:id', to: 'cars#image', as: 'car_image'
  patch 'cars/image/:id', to: 'cars#image_update'
  get 'cars/description/:id', to: 'cars#description', as: 'car_description'
  patch 'cars/description/:id', to: 'cars#description_update'
  get 'search', to: 'search#search'
  
  namespace :admin do
    resources :cars
    resources :users do
      member do
        get :toggle_status
      end
    end
  end
  root "cars#index"
end
