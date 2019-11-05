require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_initializes
    expected = {}
    assert_equal "Mac and Cheese", @recipe.name
    assert_equal expected, @recipe.ingredients_required
  end
end
