class CartController < ApplicationController
	def index
		@cart = current_user.carts
	end

	def checkout
		
	end

	def update
		if params[:cart][:quantity].to_i > 0
			@cart = Cart.find(params[:id])
			difference = @cart.quantity - (params[:cart][:quantity].to_i)
			@cart.item_type.update_attributes(:quantity => (@cart.item_type.quantity + difference), :reserved => (@cart.item_type.reserved - difference))
			@cart.update_attribute(:quantity, params[:cart][:quantity].to_i)
		else
			@cart = Cart.find(params[:id])
			@cart.destroy
		end
		redirect_to :back
	end

	def destroy
		Cart.find(params[:id]).destroy
		redirect_to :back
	end
end
