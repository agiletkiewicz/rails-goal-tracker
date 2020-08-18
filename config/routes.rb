Rails.application.routes.draw do

  resources :categories
  resources :notes
  resources :tasks

  resources :goals do 
    resources :tasks, only: [:edit, :create, :update]
    resources :notes, only: [:edit, :create, :update]
  end

  resources :users do 
    resources :goals, only: [:edit, :create, :update]
  end

  root 'users#show'
  get '/welcome' => 'static#home'
  get '/logout' => 'sessions#destroy'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
