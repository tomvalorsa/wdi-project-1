class SessionController < ApplicationController
  def new
    redirect_to root_path
  end

  def create
    # return params.inspect
    user = User.find_by :name => params[:username]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(root_path)
    else
      flash[:error] = "Invalid login or password"
      redirect_to(login_path)
    end
  end

  def destroy
    # delete the session id/end the current session
    session[:user_id] = nil
    redirect_to root_path
  end
end
