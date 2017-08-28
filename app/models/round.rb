class Round < ApplicationRecord

  validates :user_id, :deck_id, presence: true

  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :deck

  def next_card
    current_round = self.id
    p "*" * 55
    # self.deck.cards.select {|card| card.guesses.pluck(correct).include?(1)}
    result_array = self.deck.cards.select do |card|
      p "select"
      p card
      if card.guesses.where(correct: 1, round_id: current_round).exists?
        p "Not there"
         false
      else
        p "There"
        true
      end
    end
    p "^%^%^%" * 30
    p result_array
  end

  def first_try_correct
    self.deck.cards.select do |card|
      (card.guesses.pluck(:tries)== 1) && (card.guesses.pluck(:correct) == 1)

    end
  end
end
