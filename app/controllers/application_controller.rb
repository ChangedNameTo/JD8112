class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :block_ip_addresses

  after_action :verify_authorized

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    session.delete(:user_id)
    redirect_to root_path
  end

  protected

  def block_ip_addresses
    head :unauthorized if current_ip_address == "159.140.254.104"
  end

  def current_ip_address
    request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
  end
end
