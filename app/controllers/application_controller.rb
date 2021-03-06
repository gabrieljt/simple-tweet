class ApplicationController < ActionController::Base
  include SessionsHelper
  respond_to :html, :json
  responders :flash, :http_cache
  protect_from_forgery with: :exception
end
