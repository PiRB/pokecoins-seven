class Api::V1::PokemonsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_pokemon, only: [:show, :checkout, :buy, :sell]

  def index
    @pokemons = Pokemon.all

    render json: @pokemons, status: 200
  end

  def show
    render json: @pokemon, status: 200
  end

  def checkout
    render json: {message: "You are about to purchase #{@pokemon.name} from #{@pokemon.user.email}"}, status: 200
  end

  def buy
    pokemon = Pokemon.find(params[:pokemon_id])
    user = User.find(params[:user_id])
    Pokemons::Buy.new(pokemon:, user:).call
  end

  def sell
    pokemon = Pokemon.find(params[:pokemon_id])
    user = User.find(params[:user_id])
    Pokemons::Sell.new(pokemon:, user:).call
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def record_not_found
    render json: {message: 'Record not found'}, status: 404
  end

end
