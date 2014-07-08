class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :destroy]
  before_action :load_post
  def create
    if current_user && current_user.editor? || current_user && current_user.author?
      @comment = @post.comments.new(comment_params)
      @comment.save
      redirect_to posts_path
      flash[:notice] = "Comment Published"
    else
      @comment = @post.comments.new(comment_params)
      @comment.save
      redirect_to posts_path
      flash[:notice] = "Comment submited for approval"
    end
  end

  def edit
  end

  def new
    @comment = @post.comment.new
  end

  def destroy
    @post.comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def load_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author_url, :author_email, :content, :approved )
  end
end
