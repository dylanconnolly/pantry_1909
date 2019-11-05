class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end

  def ingredients_in_order_of_calories
    ingredients = @ingredients_required.sort_by do |ingredient, amount|
      (ingredient.calories * amount)
    end
    ingredients.map do |ingredient|
      ingredient[0]
    end.reverse
  end
end
