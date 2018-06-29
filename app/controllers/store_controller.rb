class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(title: :asc).paginate(page: params[:page], per_page: 9)
    if params[:query].present?
      @products = Product.order(title: :asc).search(params[:query]).paginate(page: params[:page], per_page: 9)
    else
      @products = Product.order(title: :asc).paginate(page: params[:page], per_page: 9)
    end
  end
end
