module Pokemons
  class Sell
    attr_accessor :pokemon, :user

    def initialize(pokemon:, user:)
      @pokemon = pokemon
      @user = user
    end

    # Pokemons::Sell.new(pokemon: Pokemon.first, user: User.find(2)).call
    def call
      return unpossessed_pokemon_return_message unless unpossessed_pokemon
      update_balance
      change_owner
      Transactions::Create.new(action: 2, user_id: user.id, pokemon_id: pokemon.id).call
      {message: "You successfully sold #{pokemon.name}", status: 200}
    end

    private

    def change_owner
      pokemon.update(user_id: nil)
    end

    def update_balance
      new_balance = user.balance + pokemon.price
      user.update(balance: new_balance)
    end

    def unpossessed_pokemon
      return user.id == pokemon.user.id
    end

    def unpossessed_pokemon_return_message
      {message: 'You can\'t sell this pokemon because you don\'t have it', status: 400}
    end

  end
end