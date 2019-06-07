Rails.application.routes.draw do
  get  '/signup',  to: 'users#new'
  root 'sites#home'
  resources :users
end
