Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do


    end
  end

   get 'api/v1/images', to: 'images#show'
end
