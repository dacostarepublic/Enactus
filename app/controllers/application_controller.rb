class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :force_sign_in
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end



  private
  	def current_user
  		@current_user ||= User.find(session[:id]) if session[:id]
    end
    
    def force_sign_in
       
      

  		unless current_user
        if (!["signin", "create"].include?(action_name))
        		redirect_to signin_users_path
      	end
    	end
  	end
end
