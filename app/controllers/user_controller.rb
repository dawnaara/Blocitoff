class UserController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all 
	end

	def show
	    @user = User.find(params[:id])
		unless @user == current_user
        	redirect_to :back, :alert => "Access denied."	
		end
	end

	def new
		@user = User.new
	end

	def edit
	end

   def create
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
 
     if @user.save
       flash[:notice] = "Welcome to Blocitoff #{@user.name}!"
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
   end
end 
