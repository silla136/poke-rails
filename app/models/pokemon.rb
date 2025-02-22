class Pokemon < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :element_type, presence: true
  has_many :pokeballs
  has_many :trainers, through: :pokeballs
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }
end
