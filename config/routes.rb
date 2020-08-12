Rails.application.routes.draw do
  resources :notes
  resources :tasks
  resources :goals
  resources :users

  root 'static#home'
  get '/logout' => 'sessions#destroy'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
