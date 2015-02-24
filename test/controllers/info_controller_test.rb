require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get about_us" do
    get :about_us
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
