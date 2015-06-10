class SessionsController < ApplicationController

  def login
    if request.post?
      if user = Teacher.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "teacher"
          redirect_to dashboard_teacher_path, notice: "Login Successful"
        else
          flash.now[:notice] = "User and Password do not match our records."
        end
      elsif user = Student.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "student"
          redirect_to dashboard_student_path, notice: "Login Successful"
        else
          flash.now[:notice] = "User and Password do not match our records."
        end
      elsif user = Parent.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "parent"
          redirect_to dashboard_parent_path, notice: "Login Successful"
        else
          flash.now[:notice] = "User and Password do not match our records."
        end
      end
    else
      flash.now[:notice] = "Please Login"
    end
  end

  def logout
    session[:user_id]= nil
    redirect_to sessions_login_path, notice: "Logout Successful"
  end

end
