class UsersController < ApplicationController

  # only the admin is allowed to check the user page for now, just to prove the admin account works
  before_action :check_if_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    # it already saves the values if they're in there but then it doesn't save what the user types in the
    # text boxes
    # this bit is wrong and breaking shit. params[:whatever] is empty so it's saving empty fields
    # it needs to find the right user and update THEM, not the current user
    # raise params.inspect
    @user = User.find params[:id]
    # fix - params were trapped inside user hash and needed to be rescued with another layer of hash exploration
    @user.update(:image => params[:user][:image], :bio => params[:user][:bio])
    redirect_to user_path
  end

  def create
    @user = User.create user_params

    ### fuck yes ###
    # initialises a new library for each new user (need to wipe/change the seeds to make sure they get one too)
    # proved in pry when User.last.library.posts => []
    @library = Library.create(:user_id => params[:id])
    @user.library = @library

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

  # def some user_update_params? given that we're only using :bio and :image

  def check_if_admin
    redirect_to root_path unless @current_user.present? && @current_user.is_admin?
  end

end
