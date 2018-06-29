class ProducttypeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def men
    @products = Product.order(title: :asc).paginate(page: params[:page], per_page: 9)
    if params[:query].present?
      @loai = Product.search_name(params[:query]).paginate(page: params[:page], per_page: 9)
    else
      @id = params[:id]
      @men = Product.joins("INNER JOIN genders_products on products.id = genders_products.product_id INNER JOIN genders on genders.id = genders_products.gender_id INNER JOIN types on products.type_id = types.id WHERE types.typename = '#{@id}' and genders.id = 1").paginate(page: params[:page], per_page: 9)
    end
  end

  def women
    @products = Product.order(title: :asc).paginate(page: params[:page], per_page: 9)
    if params[:query].present?
      @loai = Product.search_name(params[:query]).paginate(page: params[:page], per_page: 9)
    else
      @id = params[:id]
      @women = Product.joins("INNER JOIN genders_products on products.id = genders_products.product_id INNER JOIN genders on genders.id = genders_products.gender_id INNER JOIN types on products.type_id = types.id WHERE types.typename = '#{@id}' and genders.id = 2").paginate(page: params[:page], per_page: 9)
    end
  end

  def typeall
    @products = Product.order(title: :asc).paginate(page: params[:page], per_page: 9)
    if params[:query].present?
      @loai = Product.search_name(params[:query]).paginate(page: params[:page], per_page: 9)
    else
      @id = params[:id]
      @typeall = Product.joins("INNER JOIN types on products.type_id = types.id WHERE types.typename = '#{@id}'").paginate(page: params[:page], per_page: 9)
    end
  end
end
