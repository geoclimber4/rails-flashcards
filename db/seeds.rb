# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(user_name: "master", password: "p")

3.times {
  Deck.create( name: Faker::Superhero.name )
}

15.times {
  Card.create(
    deck_id: Deck.all.sample.id,
    question: Faker::Movie.quote + "?",
    answer: "please"
    )
}
