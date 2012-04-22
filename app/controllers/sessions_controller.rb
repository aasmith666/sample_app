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
		  sign_in user #need to create the sign_in function in the SessionsHelper
		  redirect_back_or user
	  end
  end
  
  def destroy
	  #@title = "Sign In"
	  sign_out
	  redirect_to root_path
  end

end
