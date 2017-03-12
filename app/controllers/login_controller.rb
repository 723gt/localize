class LoginController < ApplicationController
  def new
    puts @err_msg
    if session[:login_err]
      @err_msg = session[:login_err]
    else 
      @err_msg = false
    end
    session[:login_err] = nil
    @user = User.new
  end

  def create
    user = User.find_by_user_id(params[:user][:user_id])

    if user && user.authenticate(params[:user][:password])
      ctrl = "timeline"
      act = "index"
      session[:login_err] = nil
      session[:user_name] = user.name
    else
      ctrl = "login" 
      act = "new"
      session[:login_err] = "IDかパスワードが間違っています"
    end
    redirect_to(:controller => ctrl,:action => act)
  end

  def logout
    session[:user_name] = session[:user_id] = nil
    redirect_to(:root)
  end
end
