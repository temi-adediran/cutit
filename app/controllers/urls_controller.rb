class UrlsController < ApplicationController
  include MessageHelper

  before_action :set_url, only: [:details, :edit, :update, :destroy]
  before_action :redirect_to_dashboard, only: :homepage
  before_action :redirect_to_root, only: [:dashboard, :details, :edit]

  def homepage
    @recently_added_links = Url.recently_added
    @influential_users = User.influential_users
    @popular_links = Url.popular_links
  end

  def details
    @url_visits = @url.visits.order(created_at: :desc)
                      .paginate(page: params[:page], per_page: 10)
  end

  def dashboard
    @url = Url.new
    @user_urls = current_user.urls.order(created_at: :desc)
                             .paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def create
    @url = Url.new(url_params)
    @url.user_id = current_user.id if current_user

    if @url.save
      flash[:notice] = url_success
      flash[:short_url] = short_url
    else
      flash[:notice] = url_failure
    end

    redirect_to_dashboard
    redirect_to_root
  end

  def update
    if @url.update(url_params)
      redirect_to details_path,
                  notice: update_success
    else
      render :edit,
             notice: update_failure
    end
  end

  def destroy
    @url.destroy

    redirect_to dashboard_path, notice: destroyed
  end

  def redirect_url
    url = Url.find_by(short_url: params[:short_url])

    return redirect_to deleted_path if url.nil?
    return redirect_to inactive_path unless url.status

    url.store_visit(user_agent)

    redirect_to url.long_url
  end

  def inactive
  end

  def deleted
  end

  private

  def set_url
    @url ||= Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:long_url, :short_url, :status)
  end
end
