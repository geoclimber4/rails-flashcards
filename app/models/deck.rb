class Deck < ApplicationRecord
  validates :name, presence: true

  has_many :cards
  has_many :rounds
end
