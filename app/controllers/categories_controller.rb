class CategoriesController < ApplicationController
  def show
  	@category = Category.where("name LIKE ?", params[:name]).first
  	@items = @category.items
  end
end
