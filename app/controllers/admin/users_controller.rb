class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_permission

  def index
    #@users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "You have added an user"
      redirect_to admin_users_path
    else
      flash[:alert] = "Something wrong"
      render "new"
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = "User has been deleted"
    redirect_to admin_users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmatioin,
      :role)
  end
end