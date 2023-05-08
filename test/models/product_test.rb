require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(image_url: 'image.png', title: 'My Book Title', description: "yyy", price: 1) 
    Product.new(
      title: title,
      description: description,
      price: price,
      image_url: image_url
    )
  end

  test "product attributes should not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors["title"].any?
    assert product.errors["description"].any?
    assert product.errors["image_url"].any?
    assert product.errors["price"].any?
  end

  # TODO: Verify how to do test.each
  test "product price must be positive" do
    expected_price_error_message = "must be greater than or equal to 0.01"

    ok = [0.01, 0.1, 1]
    bad = [-1, 0, 0.001]

    ok.each do |price|
      assert new_product(price: price).valid?, "#{price} shouldn't be invalid"
    end

    bad.each do |price|
      product = new_product(price: price)
      assert product.invalid?, "#{price} shouldn't be valid"
      assert_equal [expected_price_error_message], product.errors["price"] 
    end 
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
      http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |image_url|
      assert new_product(image_url: image_url).valid?, "#{image_url} shouldn't be invalid"
    end
      bad.each do |image_url|
      assert new_product(image_url: image_url).invalid?, "#{image_url} shouldn't be valid"
    end 
  end

  test "product is not valid without a unique title - i18n" do
    product = new_product(title: products(:ruby).title)

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end
