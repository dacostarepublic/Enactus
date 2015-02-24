class ItemTypesController < ApplicationController
	def update
		authorize! :update, @item_type
		@item_type = ItemType.find(params[:item_type][:id])
		@item_type.update_attributes(params[:item_type])
		redirect_to :back
	end

	def destroy
		authorize! :destroy, @item_type
		redirect_to :back
	end

	def create
		authorize! :destroy, @item_type
		ItemType.create(params[:item_type])
		redirect_to :back
	end

	def reset_sold
		authorize! :update, @item_type
		redirect_to :back
	end
end
