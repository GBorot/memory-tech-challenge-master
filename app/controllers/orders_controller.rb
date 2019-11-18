class OrdersController < ApplicationController

  def index
    if params[:query].present?
      @orders = Order.search_by_brand_name_sport_category(params[:query])
    else
      @orders = Order.all
    end
  end

  def countries
    countries = []
    @orders.each do |h|
      if !countries.include?(h[:country])
        countries << h[:country]
    end
  end

  def search_country
    @orders = Order.pluck(:country).uniq
  end

  def search_result
    country = params[:query].split
    @search_result = Order.select do |order|
      country.include?(order.country)
    end
    redirect_to root_path
  end

  private

  def order_params
    data = %i[date order_id customer_id product_code product_description quantity unit_price]
    params.require(:order).permit(data)
  end
end
