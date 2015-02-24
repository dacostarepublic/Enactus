class HomeController < ApplicationController
  def index
  	@user = current_user
  	@carousels = Carousel.where(:show =>true)
  end
end
