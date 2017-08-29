class GuessesController < ApplicationController

  def show
    @guess = Guess.find(params[:id])
  end

  def create
    p params
    p "*"  * 30
    @guess = Guess.new(guesses_params)
    p @guess
    p params[:answer]
    p params[:guess]
      if params[:answer] == @guess.card.answer
        @guess.correct = 1
        p "Answer Correct"
      end
  @guess.save
  @round = Round.find(@guess.round_id)

  redirect_to "/guesses/#{@guess.id}"

  end


  private
  def guesses_params
    params.require(:guess).permit(:card_id, :round_id, :answer)
  end

end

