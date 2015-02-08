class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @post = Post.create post_params

    if @post.save
      @post.update(:user_id => @current_user.id)
      redirect_to "/posts/#{@post.id}"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :codepen, :description)
  end
end
