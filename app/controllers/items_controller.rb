class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @itemtypes = @item.item_types
    if @item == nil
      redirect_to :back
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item == nil
      redirect_to :back
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item == nil
      redirect_to :back
    else
      @item.destroy
      redirect_to :back
    end
  end
end
