Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      get '/users/:uid', to: 'users#show'
      namespace :users do
        get '/:id/favorite_itineraries', to: 'favorite_itineraries#index'
<<<<<<< HEAD
        get '/:id/itineraries', to: 'itineraries#index'
        post '/:id/itineraries', to: 'itineraries#create'
=======
        post '/:id/favorite_itineraries', to: 'favorite_itineraries#create'
        post '/:id/itineraries/:itinerary_id', to: 'itineraries#create'
>>>>>>> create favorite trips WIP
      end
    end
  end
end
