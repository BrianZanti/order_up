require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
    it {should have_many :dish_ingredients}
  end

  describe 'instance method' do
    describe '#calorie_count' do
      it 'returns the total calories for all ingredients' do
        chef = Chef.create!(name: "Brian")
        dish = chef.dishes.create!(name: 'Burgers', description: 'Meaty Goodness')
        beef = dish.ingredients.create!(name: 'Beef', calories: 442)
        cheese = dish.ingredients.create!(name: 'Cheese', calories: 654)
        bun = dish.ingredients.create!(name: 'Bun', calories: 78)

        expected = dish.ingredients.sum do |ingredient|
          ingredient.calories
        end
        expect(dish.calorie_count).to eq(expected)
      end
    end
  end
end
