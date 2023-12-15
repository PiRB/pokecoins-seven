class User < ApplicationRecord
  has_many :pokemons, inverse_of: :user
  has_many :transactions, inverse_of: :user

  validates :email, uniqueness: true
  validates :email, presence: true
end
