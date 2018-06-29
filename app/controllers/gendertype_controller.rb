class GendertypeController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @gendertype = Product.all
  end

  def men
    @men = Product.order(title: :asc).joins("INNER JOIN genders_products on products.id = genders_products.product_id INNER JOIN genders on genders.id = genders_products.gender_id WHERE genders.id = 1").paginate(page: params[:page], per_page: 9)
  end

  def women
    @women = Product.order(title: :asc).joins("INNER JOIN genders_products on products.id = genders_products.product_id INNER JOIN genders on genders.id = genders_products.gender_id WHERE genders.id = 2").paginate(page: params[:page], per_page: 9)
  end

  def mennew
    @mennew = Product.order(created_at: :asc).joins("INNER JOIN genders_products on products.id = genders_products.product_id INNER JOIN genders on genders.id = genders_products.gender_id WHERE genders.id = 1").paginate(page: params[:page], per_page: 9)
  end

  def womennew
    @womennew = Product.order(created_at: :asc).joins("INNER JOIN genders_products on products.id = genders_products.product_id INNER JOIN genders on genders.id = genders_products.gender_id WHERE genders.id = 2").paginate(page: params[:page], per_page: 9)
  end

  def sport
    @sport = Product.order(title: :asc).joins("INNER JOIN types on products.type_id = types.id WHERE types.Sport = 'true'").group("products.id").paginate(page: params[:page], per_page: 9)
  end

  def brand
    @brand = Product.order(title: :asc).joins("INNER JOIN types on products.type_id = types.id WHERE types.Sport is null").group("products.id").paginate(page: params[:page], per_page: 9)
  end
end
