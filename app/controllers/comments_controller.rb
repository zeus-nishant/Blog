class CommentsController < ApplicationController
    def create
      @blog_post = BlogPost.find(params[:blog_post_id])
      @comment = @blog_post.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @blog_post, notice: 'Comment created successfully.'
      else
        redirect_to @blog_post, alert: 'Failed to create comment.'
      end
    end
  
    def reply
      @parent_comment = Comment.find(params[:comment_id])
      @blog_post = @parent_comment.blog_post
      @comment = @blog_post.comments.build(comment_params)
      @comment.user = current_user
      @comment.parent_id = @parent_comment.id
  
      if @comment.save
        redirect_to @blog_post, notice: 'Reply created successfully.'
      else
        redirect_to @blog_post, alert: 'Failed to create reply.'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end
  