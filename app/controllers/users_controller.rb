class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @username = @user.username
        @blog_posts = @user.blog_posts

        

        @current_user = current_user if user_signed_in?
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
    
end
    #def search
       # @query = params[:query]
        #@users = User.where("username LIKE ?", "%#{@query}%")
   # end
    
    

    


  