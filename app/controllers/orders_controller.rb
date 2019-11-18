class OrdersController < ApplicationController
  def index
    if params[:query].present?
      @orders = Order.search_by_date_country_quantity_unit_price(params[:query])
    else
      @orders = Order.all
    end

    @total_revenue = @orders.map { |s| s['unit_price'] * s['quantity'] }.reduce(0, :+)
    @countries = Order.pluck(:country).uniq

    @search_country = Order.where(country: country)

    @avg_order = @orders.map { |e| e['unit_price'] * e['quantity'] }.reduce(0, :+) / @orders.size

    @total_customers = Order.pluck(:customer_id).uniq.size
  end

  private

  def order_params
    data = %i[date order_id customer_id product_code product_description quantity unit_price]
    params.require(:order).permit(data)
  end
end
