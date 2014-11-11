Rails.application.routes.draw do

  root to: 'static_pages#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :sessions, only: [:create, :destroy]
  resources :invites, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :trips
      resources :users
    end
  end

  resources :trips
  resources :users
end
