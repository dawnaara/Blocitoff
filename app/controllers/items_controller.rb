class ItemsController < ApplicationController

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was added to list."      
    else
      flash.now[:alert] = "There was an error adding your item. Please try again."      
    end
    redirect_to current_user
  end

  private 

  def item_params
    params.require(:item).permit(:name)
  end
end

