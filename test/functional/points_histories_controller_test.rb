require 'test_helper'

class PointsHistoriesControllerTest < ActionController::TestCase
  setup do
    @points_history = points_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create points_history" do
    assert_difference('PointsHistory.count') do
      post :create, points_history: { points_map_id: @points_history.points_map_id, user_id: @points_history.user_id }
    end

    assert_redirected_to points_history_path(assigns(:points_history))
  end

  test "should show points_history" do
    get :show, id: @points_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @points_history
    assert_response :success
  end

  test "should update points_history" do
    put :update, id: @points_history, points_history: { points_map_id: @points_history.points_map_id, user_id: @points_history.user_id }
    assert_redirected_to points_history_path(assigns(:points_history))
  end

  test "should destroy points_history" do
    assert_difference('PointsHistory.count', -1) do
      delete :destroy, id: @points_history
    end

    assert_redirected_to points_histories_path
  end
end
