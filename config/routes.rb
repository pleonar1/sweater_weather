Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:show]
      resources :images, only: [:show]
    end
  end

   # get 'api/v1/images', to: 'images#show'
end
