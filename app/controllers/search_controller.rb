class SearchController < ApplicationController
    def search_users
        @query = params[:query]
        @users = User.where("username LIKE ?", "%#{@query}%")
                     .includes(:blog_posts)
    end

    def search
        @query = params[:query]
        @users = User.where("username LIKE ?", "%#{@query}%")
                     .includes(:blog_posts)
    end
end
