Rails.application.routes.draw do

  resources :users, only: [:show, :new, :create]

  resources :goals do 
    resources :tasks, only: [:edit, :update, :index, :create]
    resources :notes, only: [:new, :create]
  end

  resources :tasks, only: [:index, :edit, :update, :destroy]
  resources :notes, only: [:destroy]


  root 'users#show'
  get '/logout' => 'sessions#destroy'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
