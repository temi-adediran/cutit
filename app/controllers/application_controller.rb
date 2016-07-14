class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  private

  def redirect_to_root
    redirect_to root_path unless logged_in?
  end

  def redirect_to_dashboard
    redirect_to dashboard_path if logged_in?
  end


  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    current_user.present?
  end

  def user_agent
    @user_agent ||= UserAgent.parse(request.user_agent)
  end
end
