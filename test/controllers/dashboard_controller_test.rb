require 'test_helper'
require 'dashboard_controller.rb'

def teacher_logged_in?
  true
end
def student_logged_in?
  true
end
def parent_logged_in?
  true
end

class DashboardControllerTest < ActionController::TestCase
  test "should get student" do
    session[:user_type] = "student"
    get :student
    assert_response 302
  end

  test "should get parent" do
    session[:user_type] = "parent"
    get :parent
    assert_response 302
  end

  # test "should get teacher" do
  #   session[:user_type] = "teacher"
  #   get :teacher
  #   assert_response 302
  # end

end
