class LibrariesController < ApplicationController
  def show

    user = User.find @current_user.id
    # returns an array of the user's stored posts
    @posts = user.library.posts
  end

  def add
    post = Post.find params[:id]
    @current_user.library.posts << post
    redirect_to post_path
  end

  def remove
    lib_entry = Post.find params[:id]
    # this isnt deleting the post from the array!
    @current_user.library.posts.delete(lib_entry)
    # this needs to look through the lib array and remove the relevant post (given we're on the show page, @post.id should be fine for this)
    redirect_to post_path
  end

   def remove_from_lib
    lib_entry = Post.find params[:id]
    # this isnt deleting the post from the array!
    @current_user.library.posts.delete(lib_entry)
    # this needs to look through the lib array and remove the relevant post (given we're on the show page, @post.id should be fine for this)
    redirect_to library_path
  end

  def show_post
    # needs to show the particular post
    @post = Post.find params[:id]
  end
end
