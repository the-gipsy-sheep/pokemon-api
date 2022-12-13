class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render json: @pokemons.to_json(only: %i[name type1 type2 number description image_url id]), status: 200
  end

  def show
    @pokemon = Pokemon.find_by_id(params[:id])
    if @pokemon
      render json: @pokemon.to_json(only: %i[name type1 type2 number description image_url id]), status: 200
    else
      render json: { status: 404, message: 'Selecciona un Pokemon de la primera generación (1-151)'}, status: 404
    end
  end
end
