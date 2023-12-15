class Transaction < ApplicationRecord
  enum action: {not_defined: 0, buy: 1, sell: 2}

  belongs_to :user, inverse_of: :transactions
  belongs_to :pokemon, inverse_of: :transactions
end
