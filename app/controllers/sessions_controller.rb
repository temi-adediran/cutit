require_relative '../helpers/message_helper'

class SessionsController < ApplicationController
  include MessageHelper

  before_action :redirect_to_dashboard, only: :new

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to dashboard_path
    else
      flash[:alert] = invalid_login
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
