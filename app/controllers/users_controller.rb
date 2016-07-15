class UsersController < ApplicationController
  before_action :redirect_to_dashboard, only: :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
                                 :username, 
                                 :email, 
                                 :password,
                                 :password_confirmation
                                 )
  end
end
