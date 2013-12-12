require 'test_helper'

class ExpertisesControllerTest < ActionController::TestCase
  setup do
    @expertise = expertises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expertises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expertise" do
    assert_difference('Expertise.count') do
      post :create, expertise: { expertise: @expertise.expertise, user_id: @expertise.user_id }
    end

    assert_redirected_to expertise_path(assigns(:expertise))
  end

  test "should show expertise" do
    get :show, id: @expertise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expertise
    assert_response :success
  end

  test "should update expertise" do
    put :update, id: @expertise, expertise: { expertise: @expertise.expertise, user_id: @expertise.user_id }
    assert_redirected_to expertise_path(assigns(:expertise))
  end

  test "should destroy expertise" do
    assert_difference('Expertise.count', -1) do
      delete :destroy, id: @expertise
    end

    assert_redirected_to expertises_path
  end
end
