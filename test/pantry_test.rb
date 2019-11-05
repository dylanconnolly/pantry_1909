require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new

    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_initializes_with_empty_stock_and_default_value_is_0
    expected = {}

    assert_equal expected, @pantry.stock
    assert_equal 0, @pantry.stock["Made up ingredient"]
  end

  def test_it_can_check_stock_for_amount_of_ingredient
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_restock
    @pantry.restock(@cheese, 5)

    assert_equal 5, @pantry.stock_check(@cheese)

    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for
    @pantry.restock(@cheese, 5)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 7)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 1)

    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
