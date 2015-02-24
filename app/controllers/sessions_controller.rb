class SessionsController < ApplicationController
	def create
		auth = User.authenticate(params[:user][:studentnumber],params[:user][:password])
		if auth.class.name=="User"
			#present and correct password
			session[:id] = auth.id
			auth.update_attribute(:signin_count,auth.signin_count+1)
			redirect_to root_path
		elsif auth=="Valid Credentials but not Present"
			#not present but correct password
			@user = User.create(:studentnumber=>params[:user][:studentnumber])
			session[:id]=@user.id
			@user.update_attribute(:signin_count,@user.signin_count+1)
			@user.update_attribute(:auth,SecureRandom.base64.to_s)			
			redirect_to first_sign_in_user_path(@user, :auth=>@user.auth)
		elsif auth == "User Present but Invalid Credentials"
			#present but incorrect password
			begin
				redirect_to :back
			rescue ActionController::RedirectBackError
				redirect_to signin_users_path
			end
		elsif auth == "User Not Present and Invalid Credentials"
			#Not present and incorrect password
			begin
				redirect_to :back
			rescue ActionController::RedirectBackError
				redirect_to signin_users_path
			end
      	end
    end
  
	def destroy
  		session[:id] = nil
  		redirect_to root_url, :notice => "Logged out!"
	end
end
