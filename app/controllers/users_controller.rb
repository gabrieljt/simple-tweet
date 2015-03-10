class UsersController < ApplicationController
  def new
    @user = User.new
    respond_with @user
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
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
