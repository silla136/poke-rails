class Trainer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
  has_many :pokeballs
  has_many :pokemons, through: :pokeballs
  has_one_attached :photo
end
