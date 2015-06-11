require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "successful teacher login" do
    get sessions_login_path
    assert_select "input[type=password]", 1
    post sessions_login_path, password: "password", email: "teacheremail"
    assert_redirected_to dashboard_teacher_path

    follow_redirect!
    assert response.body.match("Welcome")
    assert_select "img", 1
    assert_select "button", 5

    get assignments_path
    assert_response :success

    get new_assignment_path
    assert_response :success
    post assignments_path assignment: {name: "name", due: "2015-06-04"}
    assert_redirected_to assignments_path

    follow_redirect!
    assert_select "a[href='#{sessions_logout_path}']", 1

    get sessions_logout_path
    assert_redirected_to sessions_login_path
    follow_redirect!
    assert_select "input[type=password]", 1
  end

  test "successful student login" do
    get sessions_login_path
    assert_select "input[type=password]", 1
    post sessions_login_path, password: "password", email: "studentemail"
    assert_redirected_to dashboard_student_path

    follow_redirect!
    assert response.body.match("Welcome")
    assert_select "table", 1
    assert_select "a[href='#{sessions_logout_path}']", 1
    get sessions_logout_path
    assert_redirected_to sessions_login_path
    
    follow_redirect!
    assert_select "input[type=password]", 1
  end

  test "successful parent login" do
    get sessions_login_path
    assert_select "input[type=password]", 1
    post sessions_login_path, password: "password", email: "email"
    assert_redirected_to dashboard_parent_path

    follow_redirect!
    assert response.body.match("Welcome")
    assert_select "table", 1
    assert_select "a[href='#{sessions_logout_path}']", 1
    get sessions_logout_path
    assert_redirected_to sessions_login_path

    follow_redirect!
    assert_select "input[type=password]", 1
  end
end
