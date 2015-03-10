class SessionsController < ApplicationController
  def new
  end

  def create
    session = session_params
    @current_user = User.find_by username: session[:username].downcase if session[:username].present?

    if @current_user && @current_user.authenticate(session[:password])
      log_in @current_user
      redirect_to tweets_path
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
