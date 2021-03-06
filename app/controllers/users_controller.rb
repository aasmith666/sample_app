class UsersController < ApplicationController
  
	before_filter :authenticate, 	:except => [:show, :new, :create]
	before_filter :correct_user, 	:only => [:edit, :update]
	before_filter :admin_user, 		:only => :destroy
	
	def index
	  @users = User.paginate(:page => params[:page])
	  @title = "All Users"
	end
	
	def new
	  @user  = User.new
	  @title = "Sign Up"
	end
  
	def show
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(:page => params[:page])
		@title = @user.name	
	end
  
	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.following.paginate(:page => params[:page])
		render 'show_follow'
	end
	
	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(:page => params[:page])
		render 'show_follow'
	end
	
	def create 
		@user  = User.new(params[:user])
		if @user.save
		sign_in @user
	   #redirect_to @user
		redirect_to @user, :flash => { :success => "Welcome to the Sample App" } #this is just another way to write the above 2 lines
		else	   
			@title = "Sign Up"
			@user.password = nil #clears out the password field after submit fails and new form is rendered
			@user.password_confirmation = nil #ditto above
			render 'new'
		end
	end
  
	def edit
		#@user = User.find(params[:id])
		@title = "Edit User"
	end
  
	def update
		#@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user, :flash => { :success => "Profile updated" }
		else
			@title = "Edit User"
			render 'edit'
		end	
	end
	
	def destroy
		@user.destroy
		redirect_to users_path, :flash => { :success => "User destroyed" }
	end
  
	private
	
	
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)	
	end
	
	def admin_user
		@user = User.find(params[:id])
		redirect_to(root_path) if !current_user.admin? || current_user?(@user)
	end
end
