class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.integer   :card_id
      t.integer   :round_id
      t.integer   :correct, default: 0
      t.integer   :tries, default: 0

      t.timestamps
    end
  end
end
