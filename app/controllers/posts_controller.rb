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



      # url_array = @post.codepen.split('/')
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
    redirect_to library_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :codepen, :description)
  end
end
