class SessionsController < ApplicationController
  def new
  end

  def create
    session = session_params
    @user = User.find_by username: session[:username].downcase if session[:username].present?

    if @user && @user.authenticate(session[:password])
      redirect_to tweets_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
