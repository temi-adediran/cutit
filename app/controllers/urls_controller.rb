class UrlsController < ApplicationController
  before_action :set_url, only: [:details, :edit, :update, :destroy]
  before_action :redirect_to_dashboard, only: :homepage
  before_action :redirect_to_root, only: [:dashboard, :details, :edit]
  #before_action :store_visit, only: :check_url_status

  def homepage
    @urls = Url.all
    @recently_added_links = Url.recently_added
    @influential_users = User.influential_users
    @popular_links = Url.popular_links
  end

  def details
    @url = Url.find(params[:id])
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
      flash[:short_url] = "#{root_url}#{@url.short_url}" if current_user.nil?
      redirect_to dashboard_path
    end
  end

  def update
    if @url.update(url_params)
      redirect_to details_path, notice: 'Url was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @url.destroy
    redirect_to dashboard_path, notice: 'Url was successfully destroyed.'
  end

  def redirect_short_url
    short_url = params[:short_url]
    url = Url.find_by(short_url: short_url)

    return if url_is_nil?(url) 

    if url.status == true
      url.increment! :click_count
      store_visit
      redirect_to url.long_url
    else
      redirect_to inactive_path    
    end
  end

  def inactive
  end

  def deleted
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:long_url, :short_url, :status)
  end

  def url_is_nil?(url)
    return if url 
    true
    redirect_to deleted_path, status: 301
  end
end
