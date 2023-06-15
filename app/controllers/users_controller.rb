class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @username = @user.username
        @blog_posts = @user.blog_posts

        @current_user = current_user if user_signed_in?
    end

    #def search
       # @query = params[:query]
        #@users = User.where("username LIKE ?", "%#{@query}%")
   # end
    
    

    
end

  