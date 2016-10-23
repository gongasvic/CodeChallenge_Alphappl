class ClientesController < ApplicationController

	before_action :authenticate , except: [:create, :new, :show]

	def authenticate

		if session[:user_id].nil?
  			redirect_to(login_path)
  		end
	end

	def index
		@cliente = Cliente.find(session[:user_id])
  	end
  	
  	def create
		@cliente = Cliente.new(cliente_params)
		if @cliente.save
			redirect_to @cliente
		else
			render 'new'
		end
	end
	
	def show
    	@cliente = Cliente.find(params[:id])
    	
  		if session[:user_id].nil? 
  			redirect_to root_path
  		elsif session[:user_id] != @cliente.id
  			redirect_to cliente_path(session[:user_id])
		end

  	end

	def edit
    	@cliente = Cliente.find(params[:id])
  	end

	def new
		@cliente = Cliente.new
	end

	def update
	  	@cliente = Cliente.find(params[:id])
	 
	  	if @cliente.update(cliente_params)
	    	redirect_to @cliente
	  	else
	    	render 'edit'
	  	end
	end

	def destroy
	    @cliente = Cliente.find(params[:id])
    	@cliente.destroy
 
  	end

	private
		def cliente_params
	    	params.require(:cliente).permit(:password_confirmation, :password, :nome, :morada, :cidade, :pais, :mail, :telefone, :cpostal, :nif, :titulo, :cardNumb, :expDate, :nomeCartao)
	  	end

end
