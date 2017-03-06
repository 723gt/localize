class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    render :text => params[:user]
  end
end
