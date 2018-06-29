class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @spnew = Product.order(created_at: :ASC).all.paginate(page: params[:page], per_page: 4)
  end
end
