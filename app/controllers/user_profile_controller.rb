class UserProfileController < ApplicationController
  helper_method :current_user


  def show
    @user = User.find(params[:id])
    @username = @user.username
    @blog_posts = @user.blog_posts.order(created_at: :desc)

    @current_user = current_user if user_signed_in?
    puts @current_user.inspect
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_profile_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to user_profile_path(@user)
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
