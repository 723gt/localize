class TimelineController < ApplicationController
  def index
    if !session[:user_name]
      redirect_to(:controller => 'login',:action => 'new')
    end
  end
end
