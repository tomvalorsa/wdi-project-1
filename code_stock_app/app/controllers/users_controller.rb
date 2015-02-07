class UsersController < ApplicationController

  # only the admin is allowed to check the user page for now, just to prove the admin account works
  before_action :check_if_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.save
      #signs in the user once they've made an account
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def check_if_admin
    redirect_to root_path unless @current_user.present? && @current_user.is_admin?
  end

end
