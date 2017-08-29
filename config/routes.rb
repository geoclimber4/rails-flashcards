Rails.application.routes.draw do
  resources :decks
  #sessions may be too much, and could
  resources :sessions, only: [:new, :create, :destroy]
  # get '/sessions/new', to: 'sessions#new'
  resources :rounds, only: [:index, :create, :show] do
    resources :cards, only: [:show]
  end
  resources :guesses, only: [:show, :create]

  resources :users, except: [:index]
  root 'decks#index'


end
