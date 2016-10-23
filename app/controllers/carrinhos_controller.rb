class CarrinhosController < ApplicationController
  def show
  	@order_items = current_order.prodencomendados
  end
end
