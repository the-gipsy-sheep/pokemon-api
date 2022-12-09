Rails.application.routes.draw do
  resources :pokemons, only: %i[index show]
end
