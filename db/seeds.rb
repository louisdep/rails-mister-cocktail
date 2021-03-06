# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail_serialized = open(url).read
cocktails = JSON.parse(cocktail_serialized)

cocktails["drinks"].each do |cocktail|
  cocktail_name = cocktail["strIngredient1"]
  Ingredient.create(name: cocktail_name)
end
