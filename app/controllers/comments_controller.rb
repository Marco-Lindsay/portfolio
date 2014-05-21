class CommentsController < ApplicationController
  def create
    redirect_to posts_path
  end
  def new
    @comment = Comment.new
  end
end
