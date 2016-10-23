class PedidosController < ApplicationController
  def show
  end
  def create
  	@pedido = Pedido.new
    session[:pedido_id] = @pedido.id
		if @pedido.save
		else
			render 'new'
		end
  end
end
