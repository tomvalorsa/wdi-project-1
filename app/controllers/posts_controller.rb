class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:title)
  end

  def search
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def create
    @post = Post.create post_params

    if @post.save
      @post.update(:user_id => @current_user.id)
      @current_user.library.posts << @post

      x = @post.codepen.gsub("/pen", "/embed").gsub("http", "https")

      @post.update(:codepen_embed => x)
      redirect_to "/library/posts/#{ @post.id }"
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to "/library/posts/#{ post.id }"
  end

  def destroy
    post = Post.find params[:id]
    post.destroy

    if @current_user.is_admin?
      redirect_to posts_path
    else
      redirect_to library_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :codepen, :description, :blurb)
  end
end
