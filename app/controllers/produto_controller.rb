class ProdutoController < ApplicationController


	before_action :authenticate , except: [:index]

	def authenticate

		if session[:user_id].nil?
  			redirect_to(login_path)
  		end
	end


  def index
    	@produto = Produto.all
    	if session[:user_id] != nil
    		@cliente = Cliente.find(session[:user_id])
    	end
    	@order_item = current_order.prodencomendados.new

  	end

	def show
    	@produto = Produto.find_by(nome: params[:nome])
    	@order_item = current_order.prodencomendados.new
  	end

  	def comprar
  		#cliente_id = parametros[:cliente_id]
		#produto_id = parametros[:produto_id]
		#quantidade = parametros[:quantidade]
    	@cliente = Cliente.find_by(id: session[:user_id])
    	#@produto = Produto.find_by(id: params[:produto_id])
    	#@valtotal = @produto.preco*parametros[:quantidade]

  	end

	def new
		@produto = Produto.new
	end

  	def edit
    	@produto = Produto.find(params[:id])
  	end

  	def empregado
    	@produto = Produto.all
    	#query que devolve o valor total do stock
    	@valTotal = Produto.sum("stock*preco_unit")

  	end

	def create
		
		@produto = Produto.new(produtos_params)

		if @produto.save
			redirect_to @produto
		else
			render 'new'
		end
	end

	def update
		@produto = Produto.find(params[:id])

		if @produto.update(produtos_params)
		  redirect_to @produto
		else
		  render 'edit'
		end
	end
 
  	def destroy
	    @produto = Produto.find(params[:id])
	    	@produto.destroy
 
    	redirect_to produtos_path
  	end
 
	private
		
		def produtos_params
	    	params.require(:produtos).permit( :nome, :stock, :preco_unit, :produto_id, :cliente_id, :quantidade)
	  	end
end
