class Pokemon < ApplicationRecord
  belongs_to :user, inverse_of: :pokemons
  has_many :transactions, inverse_of: :pokemon

  validates :weight, :height, :price, :image_path, presence: true
end
