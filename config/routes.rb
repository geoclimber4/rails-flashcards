Rails.application.routes.draw do
  resources :decks
  # resources :decks, controller: 'card_decks'

  resources :sessions, only: [:new, :create, :destroy]
#custom named route:
controller :sessions do
    get 'login' => :new
    post 'login' => :create
# Below should really be a destroy, but this is easier to show
    get 'logout' => :destroy
end

# nested routes
  resources :rounds, only: [:index, :create, :show] do
    resources :cards, only: [:show]
  end
  resources :guesses, only: [:show, :create]

  resources :users, except: [:index]
  root 'decks#index'


end
