require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  it 'should show the total calorie count for the dish' do
    chef = Chef.create!(name: "Brian")
    dish = chef.dishes.create!(name: 'Burgers', description: 'Meaty Goodness')
    beef = dish.ingredients.create!(name: 'Beef', calories: 442)
    cheese = dish.ingredients.create!(name: 'Cheese', calories: 654)
    bun = dish.ingredients.create!(name: 'Bun', calories: 78)
    # bun = Ingredient.create!(name: 'Bun', calories: 78)
    # DishIngredient.create!(ingredient: bun, dish: dish)
    # DishIngredient.create!(ingredient_id: bun.id, dish_id: dish.id)
    visit "/dishes/#{dish.id}"

    expect(page).to have_content("Total Calories: #{dish.calorie_count}")
  end
end
