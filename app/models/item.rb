class Item < ActiveRecord::Base
	attr_accessible :item_name, :categories
	
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :item_types, :dependent => :destroy
	has_and_belongs_to_many :categories, :join_table=>:categories_items

	searchable do
		text :item_name
	end

	def self.tagged_with(name)
		Tag.find_by_name!(name).items
	end

	def self.tag_counts
		Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
		tags.map(&:name).join(", ")
	end

	def tag_list=(names)
		self.tags = names.split(",").map do |n|
			Tag.where(name: n.strip).first_or_create!
		end
	end
	
end
