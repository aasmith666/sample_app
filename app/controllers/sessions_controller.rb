class SessionsController < ApplicationController
  def new
	  @title = "Sign In"
	  
  end
  
  def create
	  user = User.authenticate(params[:session][:email],
								params[:session][:password])
	  
	  if user.nil?
		  flash.now[:error] = "Invalid email/password combination."
		  @title = "Sign In"
		  render 'new'
	  else
		  #handle success
	  end
  end
  
  def destroy
	  #@title = "Sign In"
	  
  end

end
