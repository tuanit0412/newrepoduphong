class ProducttypeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def show
    @id = params[:id]
    @products = Product.joins("INNER JOIN types ON products.type_id=types.id AND types.typename='#{@id}'")
  end
end
