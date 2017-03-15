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
    @time_line = Post.where(user_id: follower_id).order("updated_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    puts params[:post][:content]
    posts = Post.new(post_params)
    if posts.save
      session[:post_err] = nil
    else
      session[:post_err] = "投稿に失敗しました"
    end
    redirect_to(:action => 'index')
  end

  private
  def post_params
    params.require(:post).permit(:user_id,:content)
  end
end
