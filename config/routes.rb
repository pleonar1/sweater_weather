Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :forecast, only: [:show]
      # resources :images, only: [:show]
    end
  end

   get 'api/v1/images', to: 'images#show'
   get 'api/v1/forcasts', to: 'forecasts#show'
   get '/api/v1/munchies', to: 'munchies#show'
   post 'api/v1/users', to: 'users#create'
   post 'api/v1/sessions', to: 'sessions#create'
end
