class SessionsController < ApplicationController
  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new session_params
    User.exists? username: @user.username ? redirect_to(tweets_path) : render(:new)
  end

  def destroy
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
