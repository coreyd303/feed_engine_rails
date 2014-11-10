Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :sessions

  root 'static_pages#index'

namespace :api do
  namespace :v1 do
    resources :trips
    resources :users
  end
end

  resources :trips

end
