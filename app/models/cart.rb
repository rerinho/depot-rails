class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      puts "found item"
      current_item.quantity += 1
    else
      puts "not found item"
      current_item = line_items.build(product_id: product.id, price: product.price)
    end

    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def is_empty
    line_items.empty?
  end
end
