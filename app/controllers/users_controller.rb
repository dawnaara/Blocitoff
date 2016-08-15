class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@item = @user.item(current_user) 
  end
end
