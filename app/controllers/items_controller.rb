class ItemsController < ApplicationController
  before_action :set_users

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was added to list."      
    else
      flash.now[:alert] = "There was an error adding your item. Please try again."      
    end
    redirect_to current_user
  end

  def destroy
    @item = @user.items.find(params[:item_id])
    if @item.destroy
      flash[:notice] = "Item was deleted."      
    else
      flash.now[:alert] = "There was an error deleting your item. Please try again."      
    end

    redirect_to current_user

  end

  def complete
    @item.update_attribute(:completed_at, Time.now)

    redirect_to current_user, notice: "Item completed!"
  end

  private 

  def set_users
    @users = User.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end

end

