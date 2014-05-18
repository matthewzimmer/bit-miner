require 'test_helper'

class MinersControllerTest < ActionController::TestCase
  setup do
    @miner = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:miners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, miner: { email: @miner.email }
    end

    assert_redirected_to user_path(assigns(:miner))
  end

  test "should show user" do
    get :show, id: @miner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miner
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @miner, miner: { email: @miner.email }
    assert_redirected_to user_path(assigns(:miner))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @miner
    end

    assert_redirected_to users_path
  end
end
