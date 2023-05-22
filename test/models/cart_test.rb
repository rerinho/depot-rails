require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "should add new unique product to cart" do
    cart = Cart.new
    cart.add_product(products(:ruby))

    assert_equal 1, cart.line_items.length
    assert_equal 1, cart.line_items.first.quantity
  end

  test "should increase the quantity when a duplicated product is added to cart" do
    cart = Cart.new
    item = cart.add_product(products(:ruby))
    item.save!
    item = cart.add_product(products(:ruby))
    item.save!

    assert_equal 1, cart.line_items.length
    assert_equal 2, cart.line_items.first.quantity
  end

  test "should remove the product" do
    cart = Cart.new
    item = cart.add_product(products(:ruby))
    item.save!

    cart.remove_product(products(:ruby))

    assert_equal 0, cart.line_items.length
  end

  test "should decrease the product quantity" do
    cart = Cart.new
    item = cart.add_product(products(:ruby))
    item.save!
    item = cart.add_product(products(:ruby))
    item.save!

    cart.remove_product(products(:ruby))

    assert_equal 1, cart.line_items.length
    assert_equal 1, cart.line_items.first.quantity
  end
end
