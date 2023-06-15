class UserProfileController < ApplicationController
  def show
    @user = current_user
    @blog_posts = @user.blog_posts.order(created_at: :desc)
  end
end
