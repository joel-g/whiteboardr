class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
  end

end
