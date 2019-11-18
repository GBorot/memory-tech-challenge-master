class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def country
    @country = params[:country]
    @order = Order.select { |order| order.country.include?(@country) }
  end

  def month
    # @order_monthly = Order.all.date.group_by
  end

  private

  def order_params
    data = %i[date order_id customer_id product_code product_description quantity unit_price]
    params.require(:order).permit(data)
  end
end
