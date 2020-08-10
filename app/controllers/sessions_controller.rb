class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to pages_path, notice: "Sign in successful"
    else
      flash.now[:alert] = "Name is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to pages_path, notice: "Signed out!"
  end
end
