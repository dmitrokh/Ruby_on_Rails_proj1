Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers

  patch 'home/index/:id', to: 'pokemons#capture', as: 'capture'
  #post 'home/index', to: 'home#index'
end
