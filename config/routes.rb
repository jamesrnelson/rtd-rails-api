Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :users do
        get '/:id/favorite_itineraries', to: 'favorite_itineraries#index'
        post '/:id/itineraries', to: 'itineraries#create'
      end
    end
  end
end
