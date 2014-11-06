Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :sessions

namespace :api do
  namespace :v1 do
    resources :trips
    resources :users
    resources :groups
  end
end

  resources :trips

end
