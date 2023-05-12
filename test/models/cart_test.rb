require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "should add new unique product to cart" do
    cart = Cart.new
    cart.add_product(products(:ruby))

    assert_equal cart.line_items.length, 1
    assert_equal cart.line_items.first.quantity, 1
  end

  test "should increase the quantity when a duplicated product is added to cart" do
    cart = Cart.new
    item = cart.add_product(products(:ruby))
    item.save!

    item = cart.add_product(products(:ruby))
    item.save!

    assert_equal cart.line_items.length, 1
    assert_equal cart.line_items.first.quantity, 2
  end
end
