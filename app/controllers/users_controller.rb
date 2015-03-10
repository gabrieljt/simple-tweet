class UsersController < ApplicationController
  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new user_params

    @user.save ? redirect_to(tweets_path) : render(:new)
  end

  def show
    @user = User.find params[:id] # TODO: get logged in user in all controllers
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
