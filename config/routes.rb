Rails.application.routes.draw do
  resources :decks
  #sessions may be too much, and could
  resources :sessions, only: [:new, :create, :destroy]
  # get '/sessions/new', to: 'sessions#new'

  resources :users
  root 'decks#index'


end
