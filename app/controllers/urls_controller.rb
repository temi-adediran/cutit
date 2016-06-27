class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_dashboard, only: :index
  before_action :redirect_to_root, only: :new
  before_action :store_visit, only: :redirect_short_url

  # Homepage
  def index
    @urls = Url.all
    @recently_added_links = Url.recently_added
    @influential_users = User.influential_users
    @popular_links = Url.popular_links
  end

  # Details Url/[:id]
  def show
    @url = Url.find(params[:id])
    @url_visits = @url.visits.order(created_at: :desc)
                              .paginate(page: params[:page], per_page: 10)
  end

  # Dashboard
  def new
    @url = Url.new
    @user_urls = current_user.urls.order(created_at: :desc)
                             .paginate(page: params[:page], per_page: 10)
  end

  # Edit Urls/[:id]
  def edit
  end

  # POST /urls
  def create
    @url = Url.new(url_params)
    @url.user_id = current_user.id if current_user

    if @url.save
      flash[:short_url] = "#{root_url}#{@url.short_url}" if current_user.nil?
      redirect_to root_path
    else
      redirect_to urls_path, notice: 'Please enter a valid url'
    end
  end

  # update urls
  def update
    respond_to do |_format|
      if @url.update(url_params)
        redirect_to @url, notice: 'Url was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
    redirect_to dashboard_path, notice: 'Url was successfully destroyed.'
  end

  def redirect_short_url
    short_url = params[:short_url]
    url = Url.find_by(short_url: short_url)

    if url
      url.increment! :click_count
      redirect_to url.long_url, status: 301
    else
      redirect_to root_path, notice: 'Url does not exist'
    end
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:long_url, :short_url)
  end
end
