class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_user_id(params[:user][:user_id])

    if user && user.authenticate(params[:user][:password])
      msg = "ok"
    else
      msg = "ng"
    end
    render :text => msg
  end
end
