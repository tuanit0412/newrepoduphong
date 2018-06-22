class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 5)
    if params[:query].present?
      @products = Product.search(params[:query]).paginate(page: params[:page], per_page: 5)
    else
      @products = Product.all.paginate(page: params[:page], per_page: 5)
    end
  end
end
