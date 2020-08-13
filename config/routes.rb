Rails.application.routes.draw do

  resources :categories
  resources :notes
  resources :tasks

  resources :goals do 
    resources :tasks,only: [:edit, :create, :update]
  end

  resources :users do 
    resources :goals, only: [:edit, :create, :update]
  end

  root 'static#home'
  get '/logout' => 'sessions#destroy'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
