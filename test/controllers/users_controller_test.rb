require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get signin" do
    get :signin
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get first_sign_in" do
    get :first_sign_in
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

  test "should get history" do
    get :history
    assert_response :success
  end

end
