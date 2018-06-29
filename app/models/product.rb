class Product < ApplicationRecord
  has_and_belongs_to_many :genders
  has_many :size_details
  has_many :sizes, through: :size_details
  include PgSearch
  pg_search_scope :search, against: {
                             title: "A",
                             description: "B",
                             price: "C",

                           },
                           using: {
                             tsearch: {
                               prefix: true,
                               any_word: true,
                               negation: true,
                               dictionary: "english",
                             },
                           }

  has_attached_file :image, styles: {medium: "10000x10000>", thumb: "10000x10000>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :price, presence: true
  validates :price, numericality: true
  belongs_to :type

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line Items present")
      throw :abort
    end
  end
end
