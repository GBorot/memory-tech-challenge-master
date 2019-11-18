class OrdersController < ApplicationController
  def index
    if params[:query].present?
      @orders = Order.search_by_date_country_quantity_unit_price(params[:query])
    else
      @orders = Order.all
    end
  end

  # def countries
  #   countries = []
  #   @orders.each do |h|
  #     if !countries.include?(h[:country])
  #       countries << h[:country]

  #   end
  # end

  def search_by_country(country)
    @search_result = Order.where(country: country)
  end

  private

  def order_params
    data = %i[date order_id customer_id product_code product_description quantity unit_price]
    params.require(:order).permit(data)
  end
end
