class SessionsController < ApplicationController

	

  	def new

  	end

  	def create
  		cliente = Cliente.find_by(mail: params[:session][:mail])
    	if cliente && cliente.authenticate(params[:session][:password])
    		# Log the user in and redirect to the user's show page.
    		log_in cliente
#    		if params[:session][:remember_me] == '1'
#			  	remember(cliente)
#			  else
#			  	forget(cliente)
#			  end
    		redirect_to cliente
	    else
	      flash[:danger] = 'Invalid email/password combination'
	      render 'new'
    	end
  	end

  	def destroy
    	log_out if logged_in?
    	redirect_to root_url
  	end


end
