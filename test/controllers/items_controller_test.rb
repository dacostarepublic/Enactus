require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get _item" do
    get :_item
    assert_response :success
  end

  test "should get _item_detailed" do
    get :_item_detailed
    assert_response :success
  end

end
