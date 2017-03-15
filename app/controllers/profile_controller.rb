class ProfileController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find_by(:user_id => user_id)
  end
end
