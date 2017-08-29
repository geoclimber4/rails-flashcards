class CardDecksController < ApplicationController

  def index
    @decks = Deck.all
  end

end
