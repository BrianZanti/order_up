require 'rails_helper'

RSpec.describe "Chef Ingredients Index" do
  # As a visitor
  # When I visit a chef's show page
  # I see the name of that chef
  # And I see a link to view a list of all ingredients that this chef uses in their dishes
  # When I click on that link
  # I'm taken to a chef's ingredient index page
  # and I can see a unique list of names of all the ingredients that this chef uses

  it 'displays all ingredients for a chef' do
    chef = Chef.create!(name: "Brian")

    burger = chef.dishes.create!(name: 'Burgers', description: 'Meaty Goodness')
    beef = burger.ingredients.create!(name: 'Beef', calories: 442)
    cheese = burger.ingredients.create!(name: 'Cheese', calories: 654)
    bun = burger.ingredients.create!(name: 'Bun', calories: 78)

    tacos = chef.dishes.create!(name: 'Tacos', description: 'Stuff in a Tortilla')
    # tacos.ingredients << beef
    DishIngredient.create!(dish: tacos, ingredient: beef)
    tacos.ingredients << cheese
    tortillas = tacos.ingredients.create!(name: 'tortillas', calories: 100)
  end
end
