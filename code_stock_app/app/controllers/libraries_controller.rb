class LibrariesController < ApplicationController
  def show

    user = User.find @current_user.id
    # returns an array of the user's stored posts
    @posts = user.library.posts
  end
end
