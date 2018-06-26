class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    if params[:query].present?
      @products = Product.search(params[:query]).paginate(page: params[:page], per_page: 15).order(created_at: :desc)
    else
      @products = Product.all.paginate(page: params[:page], per_page: 15).order(created_at: :desc)
    end
    if current_user
      if current_user.admin == true
        redirect_to rails_admin_path
      end
    end
  end
end
