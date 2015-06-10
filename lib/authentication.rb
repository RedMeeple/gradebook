module Authentication

  private def teacher_logged_in?
    unless Teacher.find_by_id(session[:user_id]) && (session[:user_type] == "teacher")
      redirect_to sessions_login_path, notice: 'Please login to view this page.'
    end
  end
  
  private def student_logged_in?
    unless Student.find_by_id(session[:user_id]) && (session[:user_type] == "student")
      redirect_to sessions_login_path, notice: 'User or Password does not match our records.'
    end
  end

  private def parent_logged_in?
    unless Parent.find_by_id(session[:user_id]) && (session[:user_type] == "parent")
      redirect_to sessions_login_path, notice: 'User or Password does not match our records.'
    end
  end

end
