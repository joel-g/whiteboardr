class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @params = params
    @user = User.new(user_params)
    if @user.save
      login(@user.email, params[:user][:password])
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end
end
