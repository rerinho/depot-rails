class CopyProductPriceIntoLineItems < ActiveRecord::Migration[6.0]
  def change
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!
    end
  end
end
