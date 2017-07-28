class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user = login(@user.email, params[:user][:password])
        redirect_to root_path
      else
        flash.now[:alert] = 'Login failed'
        render :new
      end
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
