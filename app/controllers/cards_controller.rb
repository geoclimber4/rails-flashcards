class CardsController < ApplicationController

  def show
    @round = Round.find(params[:round_id])
    @card = Card.find(params[:id])
  end

end

