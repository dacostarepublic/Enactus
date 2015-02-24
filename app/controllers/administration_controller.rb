class AdministrationController < ApplicationController
	def index
		
	end
	
	def carousel
		
	end
	
	def items
		@s = Item.search {fulltext params[:search]}
		@items = @s.results
	end

	def new_item
		puts "=========================================="
		puts params
		puts "=========================================="

		Item.create(params[:item])

		redirect_to :back
	end
end
