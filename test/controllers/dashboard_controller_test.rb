require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get student" do
    get :student
    assert_response :success
  end

  test "should get parent" do
    get :parent
    assert_response :success
  end

  test "should get teacher" do
    get :teacher
    assert_response :success
  end

end
