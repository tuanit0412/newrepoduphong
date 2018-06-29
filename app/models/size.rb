class Size < ApplicationRecord
  has_many :size_details
  has_many :products, through: :size_details
  has_many :line_items
  has_many :orders, through: :line_items
  validates :sizeuk, :sizeus, :sizevn, numericality: true
  validates :sizeus, :sizeuk, :sizevn, presence: true
end
