require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    describe '#uniq_ingredients' do
      it 'displays a list of unique ingredients that this chef uses in their dishes' do
        chef = Chef.create!(name: "Brian")
        other_chef = Chef.create!(name: "Other Chef")

        burger = chef.dishes.create!(name: 'Burgers', description: 'Meaty Goodness')
        beef = burger.ingredients.create!(name: 'Beef', calories: 442)
        cheese = burger.ingredients.create!(name: 'Cheese', calories: 654)
        bun = burger.ingredients.create!(name: 'Bun', calories: 78)

        tacos = chef.dishes.create!(name: 'Tacos', description: 'Stuff in a Tortilla')
        # tacos.ingredients << beef
        DishIngredient.create!(dish: tacos, ingredient: beef)
        tacos.ingredients << cheese
        tortillas = tacos.ingredients.create!(name: 'tortillas', calories: 100)

        bad_dish = other_chef.dishes.create!(name: "Bad Dish", description: "It Sucks")
        bad_ingredient = bad_dish.ingredients.create!(name: "Bad Ingredient", calories: 9999999)

        expected = [beef, cheese, bun, tortillas]
        expect(chef.uniq_ingredients.sort).to eq(expected.sort)
      end
    end
  end
end
