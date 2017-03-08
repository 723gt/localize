class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_user_id(params[:user][:user_id])

    if user && user.authenticate(params[:user][:password])
      ctrl = "timeline"
      act = "index"
    else
      ctrl = "login" 
      act = "new"
    end
    redirect_to(:controller => ctrl,:action => act)
  end
end
