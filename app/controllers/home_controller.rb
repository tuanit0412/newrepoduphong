class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.where("price = 100").all.paginate(page: params[:page], per_page: 5)
    if params[:query].present?
      @products = Product.where("price = 1000").search(params[:query]).paginate(page: params[:page], per_page: 15)
    else
      @products = Product.where("price = 1000").all.paginate(page: params[:page], per_page: 15)
    end
    if current_user
      if current_user.admin == true
        redirect_to rails_admin_path
      end
    end
  end
end
