class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create comment_params
    comment.update(:user_id => @current_user.id)
    comment.update(:post_id => params[:comment][:post_page_id])
    redirect_to "/posts/#{ comment.post_id }"
  end

  def show
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end

end

