Rails.application.routes.draw do

  resources :tools

  resources :users

  get    '/login', to: 'session#new'
  post   '/login', to: 'sessions#create'
  delete '/login', to: 'session#destroy'
end
