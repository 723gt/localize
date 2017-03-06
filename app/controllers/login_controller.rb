class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.all
    puts @user.find_by_user_id(params[:user][:user_id]).nil?
    if @user.find_by_user_id(params[:user][:user_id])
      msg = "ok"
    else
      msg = "ng"
    end
    render :text => msg
  end
end
