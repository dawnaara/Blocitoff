class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was added to list."
      redirect_to [@user, @item]
    else

      flash.now[:alert] = "There was an error adding your item. Please try again."
      render :new
    end
  end
end


