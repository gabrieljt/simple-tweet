class SessionsController < ApplicationController
  def new
  end

  def create
    session = session_params
    @user = User.find_by username: params[:session][:username].downcase if session[:username].present?

    @user && @user.authenticate(params[:session][:password]) ? redirect_to(tweets_path) : render(:new)
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
