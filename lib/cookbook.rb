class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def recipe_details(recipe)
    details = {}
    details[:ingredients] = recipe.ingredients_in_order_of_calories_with_amount.map do |ingredient|
                              ingredient_hash = {}
                              ingredient_hash[:ingredient] = ingredient[0].name
                              ingredient_hash[:amount] = ingredient[1].to_s + " " + ingredient[0].unit
                              ingredient_hash
                              end

    details[:total_calories] = recipe.total_calories
    details
  end

  def summary
    x = @recipes.map do |recipe|
      recipe_info = {}
      recipe_info[:name] = recipe.name
      recipe_info[:details] = recipe_details(recipe)
      recipe_info
    end
  end
end
