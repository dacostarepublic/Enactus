class ItemType < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper
	has_attached_file :picture, :styles => {:medium => "240x240"}
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	attr_accessible :item_id, :item, :amount, :unit, :quantity, :price, :picture, :reserved

	belongs_to :item

	def cost
		number_to_currency(self.try("price"),:unit=>"R", :precision=>2, :format=>"%u%n", :raise=>true)
	end
end
