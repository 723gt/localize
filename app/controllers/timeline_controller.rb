class TimelineController < ApplicationController
  def index
    if !session[:user_name]
      redirect_to(:controller => 'login',:action => 'new')
    end
    follower = Follow.where(user_id: session[:user_id])
    follower_id = Array.new
    follower.each_with_index do |f,i|
      follower_id[i] = f.follow_id
    end
    @time_line = Post.where(user_id: follower_id)
  end
end
