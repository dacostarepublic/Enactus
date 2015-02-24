class Contactnumber < ActiveRecord::Base
  belongs_to :users
  attr_accessible :contactnumber, :user_id, :user
  validates :contactnumber, phone: { possible: true, allow_blank: false, types: [:mobile] }
end
