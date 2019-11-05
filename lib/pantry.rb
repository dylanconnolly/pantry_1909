class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    enough_for_each_ingredient = recipe.ingredients_required.map do |ingredient, amount|
      stock_check(ingredient) >= amount
    end
    !enough_for_each_ingredient.include?(false)
  end
end
