Rails.application.routes.draw do
   get 'api/v1/images', to: 'images#show'
   get 'api/v1/forcasts', to: 'forecasts#show'
   get '/api/v1/munchies', to: 'munchies#show'
   post 'api/v1/users', to: 'users#create'
   post 'api/v1/sessions', to: 'sessions#create'
   post 'api/v1/road_trip', to: 'road_trip#create'
end
