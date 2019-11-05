require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test

  def setup
    @ingredient = Ingredient.new
  end

  def test_it_exists
    assert_instance_of Ingredient, @ingredient
  end
end
