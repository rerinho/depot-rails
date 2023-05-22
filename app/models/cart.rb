class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id, price: product.price)
    end

    current_item
  end

  def remove_product(product)
    current_item = line_items.find_by(product_id: product.id)

    return if !current_item

    if current_item.quantity == 1
      line_items.delete(current_item)
    else
      current_item.quantity -= 1
      current_item.save
    end

    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def empty?
    line_items.empty?
  end
end
