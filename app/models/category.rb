class Category < ActiveRecord::Base
	attr_accessible :name, :items
	has_and_belongs_to_many :items, :join_table => :categories_items
end
