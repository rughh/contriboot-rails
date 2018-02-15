Rails.application.routes.draw do
  get 'contributions/index'

  resources :users


  resources :contributions do
    member do
      patch :toggle_vote
    end
  end

  get '/print' => 'printout#index', as: :print

  root to: 'contributions#index'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
