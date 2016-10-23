class ProdencomendadosController < ApplicationController
	def create
    @order = current_order
    @order_item = @order.prodencomendados.new(order_item_params)
    @order.save
    session[:pedido_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.prodencomendados.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.prodencomendados
  end

  def destroy
    @order = current_order
    @order_item = @order.prodencomendados.find(params[:id])
    @order_item.destroy
    @order_items = @order.prodencomendados
  end
private
  def order_item_params
    params.require(:prodencomendado).permit(:quantidade, :produto_id)
  end
end
