class User < ActiveRecord::Base
  attr_accessible :name, :surname, :residence_id, :contactnumber, :contactnumber_id, :studentnumber
  belongs_to :residence
  has_one :contactnumber
  has_one :email
  has_many :carts
  # validates :attribute, contactnumber: { possible: true, allow_blank: true, types: [:mobile] }
  rolify

  after_create :defaultRole 
  require 'gmail'
  def fullname
    [self.try('name'), " ", self.try("surname")].join.to_s
  end

  def total_cart_items
    return self.carts.to_a.sum {|l| l.try("quantity")} || 0
  end

  def defaultRole
    self.add_role :student
  end

  def self.authenticate(studentnumber,password)
    user = User.where(:studentnumber => studentnumber).first
    if user != nil 
      gmail = Gmail.new("#{studentnumber}@myuwc.ac.za",password)
      begin
        gmail.login
        gmail.logout
        return user
      rescue Net::IMAP::NoResponseError
        return "User Present but Invalid Credentials"
      end
    else #if user not present
      gmail = Gmail.new("#{studentnumber}@myuwc.ac.za",password)
      begin
        gmail.login
        gmail.logout
        return "Valid Credentials but not Present"
      rescue Net::IMAP::NoResponseError
        return "User Not Present and Invalid Credentials"
      end
    end      
  end
end
