class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_dashboard, only: :index
  before_action :redirect_to_root, only: :new

  # GET /urls
  def index
    @urls = Url.all
    @recently_added_links = Url.recently_added
    @influential_users = User.influential_users
  end

  # GET /urls/1
  def show
  end

  # GET /urls/new
  def new
    @url = Url.new
    @user_urls = current_user.urls.order(created_at: :desc)
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  def create
    @url = Url.new(url_params)
    @url.user_id = current_user.id if current_user

    if @url.save
      flash.now[:short_url] = "#{root_url}#{@url.short_url}"
      redirect_to root_path
    else
      redirect_to urls_path, notice: 'Please enter a valid url'
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def redirect_short_url
    short_url = params[:short_url]
    url = Url.find_by(short_url: short_url)

    if url
      redirect_to url.long_url, status: 301
    else
      redirect_to root_path, notice: 'Url does not exist'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_url
    @url = Url.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def url_params
    params.require(:url).permit(:long_url, :short_url)
  end
end
