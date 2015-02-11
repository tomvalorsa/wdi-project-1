class PostsController < ApplicationController
  def index
    # need to sort this out as it separated capital and lower case letters
    # could do this by forcing the user input to downcase, sorting it here and then capitalizing it on the view
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
  end

  def create
    @post = Post.create post_params

    if @post.save
      @post.update(:user_id => @current_user.id)
      @current_user.library.posts << @post

      # url_sub = @post.codepen.gsub("pen", "embed")

      # literally the worst thing ever. Make it cleaner and less horrific by learning how to gsub out the last occurrence of a substring (attempt at gsub above needs tweaking)
      url_array = @post.codepen.split('/')
      url_array[0] = 'https:/'
      url_array[1] += '/'
      url_array[2] += '/'
      url_array[3] += '/'
      url_array[4] = 'embed/'
      url_array[5] += '/'
      x = url_array.join

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
