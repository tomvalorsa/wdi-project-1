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
      @current_user.library.posts << @post
      redirect_to "/posts/#{@post.id}"
    end
  end



  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to post_path
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :codepen, :description)
  end
end
