class ShopController < ApplicationController
  def index
  	@categories = Category.all
  end

  def specials

  end

  def add_to_cart
    Cart.add(params[:cart_item])
    redirect_to :back
  end
end
