class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def user_params
        params.require(:user).permit(:avatar)
    end

    def show
        @user = User.find(params[:id])
        @username = @user.username
        @blog_posts = @user.blog_posts

        

        @current_user = current_user if user_signed_in?
    end

    def follow
        @user = User.find(params[:id])
        current_user.followed_users << @user
        redirect_to user_path(@user)
      end
    
      def unfollow
        @user = User.find(params[:id])
        current_user.followed_users.delete(@user)
        redirect_to user_path(@user)
      end
end
    
    

    


  