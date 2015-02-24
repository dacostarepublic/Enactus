class Cart < ActiveRecord::Base
  attr_accessible :user, :user_id, :item_type, :item_type_id, :quantity
  validates :user_id, :presence => true
  validates :item_type_id, :presence => true
  validates :quantity, :numericality => {:greater_than => 0}
  belongs_to :user
  belongs_to :item_type
  before_destroy :return_items

  def self.add(cart_item)
  	s = self.where(:item_type_id=>cart_item[:item_type_id], :user_id=>cart_item[:user_id]).first
  	if s==nil
	  	c = self.new
	  	c.user_id = cart_item[:user_id]
	  	c.item_type_id = cart_item[:item_type_id]
	  	c.quantity = cart_item[:quantity]
	  	if c.quantity > 0
	  		if c.save
	  			i = ItemType.find(c.item_type_id)
	  			i.update_attributes(:quantity => (i.quantity - c.quantity), :reserved=>(i.reserved + c.quantity))
	  		end
	  	end
	else
		s.quantity = s.quantity + cart_item[:quantity].to_i
		if s.quantity > 0
	  		if s.save
	  			i = ItemType.find(s.item_type_id)
	  			i.update_attributes(:quantity => (i.quantity - s.quantity), :reserved=>(i.reserved + s.quantity))
	  		end
	  	end
	end
  end


  private
  	def return_items
  		@item_type = self.item_type
  		@item_type.update_attributes(:quantity => (@item_type.quantity + self.quantity), :reserved => (@item_type.reserved - self.quantity))
  	end
end
