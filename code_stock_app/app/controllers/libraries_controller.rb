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
end
