Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      get '/users/:uid', to: 'users#show'
      namespace :users do
        get '/:uid/favorites', to: 'favorite_itineraries#index'
        get '/:uid/favorites/:itinerary_id', to: 'favorite_itineraries#show'
        put '/:uid/favorites/:itinerary_id', to: 'favorite_itineraries#edit'
        delete '/:uid/favorites/:itinerary_id', to: 'favorite_itineraries#delete'
        post '/:uid/itineraries/:itinerary_id', to: 'favorite_itineraries#create'
        get '/:uid/itineraries', to: 'itineraries#index'
        post '/:uid/itineraries', to: 'itineraries#create'
      end
    end
  end
end
