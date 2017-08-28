class RoundsController < ApplicationController

  def index
    @rounds = Round.all
  end

  def create
    p "*"* 50
    p params
    p "%"*40
    p round_params
    @round = Round.new(round_params)

    if @round.save
      p "winner"
      redirect_to "/rounds/#{@round.id}"
    else
      redirect_to "https://www.google.com"
      p "$"* 50
      p @round
    end
  end

  def show
    @round = Round.find(params[:id])
  end



  private
  def round_params
    params.require(:round).permit(:user_id, :deck_id)
  end
end
