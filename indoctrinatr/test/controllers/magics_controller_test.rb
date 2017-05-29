require 'test_helper'

class MagicsControllerTest < ActionController::TestCase
  setup do
    @magic = magics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create magic" do
    assert_difference('Magic.count') do
      post :create, magic: { spell: @magic.spell }
    end

    assert_redirected_to magic_path(assigns(:magic))
  end

  test "should show magic" do
    get :show, id: @magic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @magic
    assert_response :success
  end

  test "should update magic" do
    patch :update, id: @magic, magic: { spell: @magic.spell }
    assert_redirected_to magic_path(assigns(:magic))
  end

  test "should destroy magic" do
    assert_difference('Magic.count', -1) do
      delete :destroy, id: @magic
    end

    assert_redirected_to magics_path
  end
end
