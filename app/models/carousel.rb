class Carousel < ActiveRecord::Base
  belongs_to :item
  attr_accessible :picture, :item, :item_id, :show
  has_attached_file :picture, :styles=>{:mobile=>"660x220"}
  validates :picture, :presence => true
  validates :item_id, :presence => true
end
