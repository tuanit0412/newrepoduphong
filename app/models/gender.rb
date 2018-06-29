class Gender < ApplicationRecord
  has_and_belongs_to_many :products
  validates :namegd, presence: true
end
