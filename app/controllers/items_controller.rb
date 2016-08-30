class ItemsController < ApplicationController
  before_action :set_users

  def create
    @item = current_user.items.build(item_params)
    @item = current_user.items
    @item.update_attribute(:created_at, Time.now)

    if @item.save
      flash[:notice] = "Item was added to list."      
    else
      flash.now[:alert] = "There was an error adding your item. Please try again."      
    end
    redirect_to current_user
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    if @item.destroy
      flash[:notice] = "Item was deleted."      
    else
      flash.now[:alert] = "There was an error deleting your item. Please try again."      
    end

    respond_to do |format|
      format.html
      format.js
    end    
  end

  private 

  def set_users
    @users = User.find(params[:user_id])
  end

  def item_params
    params.require(:item).permit(:name)
  end

end

