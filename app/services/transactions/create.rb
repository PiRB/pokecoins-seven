module Transactions
  class Create
    attr_reader :action, :user_id, :pokemon_id

    def initialize(action:, user_id:, pokemon_id:)
      @action = action
      @user_id = user_id
      @pokemon_id = pokemon_id
    end

    def call
      Transaction.create(action: action, user_id: user_id, pokemon_id: pokemon_id)
    end
  end
end