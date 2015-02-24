class Email < ActiveRecord::Base
  belongs_to :users
  attr_accessible :email, :user, :user_id
  validates :email, :presence => true
end
