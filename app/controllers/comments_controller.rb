class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :destroy]
  before_action :load_post
  def create
    redirect_to posts_path
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        current_user.posts << @comment
        format.html { redirect_to @comment, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
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
    params.require(:comment).permit(:author_url, :author_url, :content)
  end
end
