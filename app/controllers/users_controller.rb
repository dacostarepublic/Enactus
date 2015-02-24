class UsersController < ApplicationController
  def index
  end

  def signin
    if current_user
      redirect_to root_path
    end
  end

  def show
  end

  def add_to_cart
        
  end

  def first_sign_in
    @user = User.find(params[:id])

    if @user.auth != params[:auth]
      redirect_to root_path
    else
      @residences = Residence.all.map { |e| [e.name,e.id]  }
    end
  end

  def update
    u = params[:u]
    @user = User.find(params[:id])
    if u[:from] == "first_sign_in"
      @user.name = u[:name]
      @user.surname = u[:surname]
      @user.residence_id = u[:residence_id]
      if Phonelib.valid?(u[:contactnumber])
        @user.contactnumber = Contactnumber.create(:contactnumber=>u[:contactnumber])
      end  
      @user.save
    else
      
    end
    redirect_to root_path
  end

  def settings
  end

  def history
  end

  def create
  end
end
