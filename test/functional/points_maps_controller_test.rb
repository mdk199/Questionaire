require 'test_helper'

class PointsMapsControllerTest < ActionController::TestCase
  setup do
    @points_map = points_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create points_map" do
    assert_difference('PointsMap.count') do
      post :create, points_map: { action: @points_map.action, controller: @points_map.controller, point: @points_map.point }
    end

    assert_redirected_to points_map_path(assigns(:points_map))
  end

  test "should show points_map" do
    get :show, id: @points_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @points_map
    assert_response :success
  end

  test "should update points_map" do
    put :update, id: @points_map, points_map: { action: @points_map.action, controller: @points_map.controller, point: @points_map.point }
    assert_redirected_to points_map_path(assigns(:points_map))
  end

  test "should destroy points_map" do
    assert_difference('PointsMap.count', -1) do
      delete :destroy, id: @points_map
    end

    assert_redirected_to points_maps_path
  end
end
