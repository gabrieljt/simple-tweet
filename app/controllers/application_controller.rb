class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception
  responders :flash, :http_cache
  before_action :authenticate_user!
end
