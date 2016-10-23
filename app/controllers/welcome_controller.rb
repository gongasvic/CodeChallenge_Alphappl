class WelcomeController < ApplicationController
  def index
  	if !session[:user_id].nil? 
  		@cliente = Cliente.find(session[:user_id])
  	end
	if !Produto.count.zero?
		@produtos = Produto.last(5).reverse
		@contagem = @produtos.count
	end
  end
end
