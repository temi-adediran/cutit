class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def redirect_to_root
    redirect_to root_path unless logged_in?
  end

  def redirect_to_dashboard
    redirect_to dashboard_path if logged_in?
  end

  def store_visit
    url = Url.find_by(short_url: params[:short_url])
    Visit.create ({
      browser: user_agent.browser,
      version: user_agent.version,
      os: user_agent.os,
      platform: user_agent.platform,
      url_id: url.id
    })
  end

  private

  def user_agent
    @user_agent ||= UserAgent.parse(request.user_agent)
  end
end
