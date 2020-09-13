class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def uniq_ingredients
    ingredients.distinct
    # self.dishes.joins(:ingredients).distinct
  end
end


# Chef ->  Dish
# Dish -> DishIngredient -> Ingredient
# Chef -> Dish -> DishIngredient -> Ingredient
