class UsersController < ApplicationController
  def new
    if !logged_in?
      @user = User.new
      respond_with @user
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
