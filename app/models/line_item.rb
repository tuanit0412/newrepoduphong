class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :size, optional: true
  belongs_to :cart
  $total

  def total_price
    product.price * quantity
    $total = product.price * quantity
  end

  def self.total
    return $total
  end
end
