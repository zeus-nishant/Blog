class SearchController < ApplicationController
    def search_users
        @query = params[:query]
        @users = User.where("name LIKE ?", "%#{@query}%")
    end

    def search
        @query = params[:query]
        @users = User.where("username ILIKE ?", "%#{@query}%")
    end
end
