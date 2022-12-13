class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show update destroy]

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

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render json: @pokemon, status: 201
    else
      render json: { status: 422, error: 'Error creando la entrada'}, status: :unprocesable_entity
    end
  end

  def update
    if @pokemon
      @pokemon.update(pokemon_params)
      render json: { message: 'Entrada grabada correctamente' }, status: 200
    else
      render json: { status: 404, message: 'Pokemon no encontrado' }, status: 404
    end
  end

  def destroy
    if @pokemon
      @pokemon.destroy
      render json: { message: 'Entrada eliminada correctamente' }, status: 200
    else
      render json: { status: 404, message: 'Pokemon no encontrado' }, status: 404
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :type1, :type2, :number, :description, :image_url)
  end

  def set_pokemon
    @pokemon = Pokemon.find_by_id(params[:id])
  end
end
