class RoundsController < ApplicationController

  def index
    @rounds = Round.all
  end

  def create
    @round = Round.new(round_params)

    if @round.save
      p "winner"
      redirect_to "/rounds/#{@round.id}"
    else
      redirect_to "https://www.google.com"
    end
  end

  def show
    @round = Round.find(params[:id])
    @cards = @round.next_card
    @card = @cards.first

    if @card
      redirect_to "/rounds/#{@round.id}/cards/#{@card.id}"
    else
      render "show"
    end
  end



  private
  def round_params
    params.require(:round).permit(:user_id, :deck_id)
  end
end
