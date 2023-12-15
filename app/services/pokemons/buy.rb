module Pokemons
  class Buy
    attr_accessor :pokemon, :user

    def initialize(pokemon:, user:)
      @pokemon = pokemon
      @user = user
    end

    # Pokemons::Buy.new(pokemon: Pokemon.first, user: User.find(2)).call
    def call
      return not_enough_balance_return_message unless user_has_enough_balance
      update_balances
      change_owner
      Transactions::Create.new(action: 1, user_id: user.id, pokemon_id: pokemon.id).call
      {message: "You successfully bought #{pokemon.name}", status: 200}
    end

    private

    def change_owner
      pokemon.update(user_id: user.id)
    end

    def update_balance
      new_balance = user.balance - pokemon.price
      user.update(balance: new_balance)
    end

    def user_has_enough_balance
      return user.balance >= pokemon.price
    end

    def not_enough_balance_return_message
      {message: 'You don\'t have enough money to buy this pokemon, please add some balance to your account to purchase this adorable pokemon', status: 400}
    end

  end
end