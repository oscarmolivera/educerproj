Rails.application.routes.draw do
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  
  root 'sites#home'
  resources :users
end
