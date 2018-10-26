Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers

  patch 'home/index/:id', to: 'pokemons#capture', as: 'capture'
  patch '/pokemons/:id', to: 'pokemons#damage', as: 'damage'
  get '/pokemons/new', to: 'pokemons#new', as: 'new_pokemon'
  post '/pokemons/new', to: 'pokemons#create', as: 'create_new_pokemon'
  #post 'home/index', to: 'home#index'
end
