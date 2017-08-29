class User < ApplicationRecord
  has_secure_password
  has_many :rounds
  has_many :played_decks, through: :rounds, source: :deck
  validates :user_name, {presence: true, uniqueness: true}
  
  validates :user_name, uniqueness: true
  validates :user_name, :password_digest, presence: true


end
