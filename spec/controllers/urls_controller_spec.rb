require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  before(:all) { create(:url) }
  let(:url) { Url.last }

  describe 'before actions' do
    it { should use_before_action(:set_url) }
    it { should use_before_action(:redirect_to_dashboard) }
    it { should use_before_action(:redirect_to_root) }
  end

  describe '#homepage' do
    before(:each) { get :homepage }

    it 'renders the :homepage view' do
      expect(response).to render_template 'homepage'
    end

    it 'populates the recently added links' do
      expect(assigns(:recently_added_links)).to eq([url])
    end

    it 'populates the popular links' do
      Url.destroy_all
      @first_url = create(:url, click_count: 3)
      @second_url = create(:url, click_count: 4)
      expect(assigns(:popular_links)).to eq([@second_url, @first_url])
    end
  end

  describe '#details' do
    before(:each) do
      session[:user_id] = create(:user).id
      get :details, id: url.id
    end

    it 'renders the :details view' do
      expect(response).to render_template 'details'
    end

    it 'assigns the requested url to @url' do
      expect(assigns(:url)).to eq(url)
    end
  end

  describe '#dashboard' do
    before(:each) do
      session[:user_id] = create(:user).id
      get :dashboard
    end

    it 'renders the :dashboard view' do
      expect(response).to render_template :dashboard
    end

    it 'assigns a new Url to @url' do
      expect(assigns(:url)).to eq(url)
    end
  end

  describe '#edit' do
    before(:each) do
      session[:user_id] = create(:user).id
      get :edit, id: url.id
    end

    it 'renders the :edit view' do
      expect(response).to render_template 'edit'
    end
  end

  describe '#create' do
    context 'with valid details' do
      it 'creates a new url' do
        expect(Url.all.count).to eq(1)
      end

      xit { should set_flash[:short_url] }

      xit { should set_flash[:notice] }
    end

    context 'with invalid details' do
      #  before(:each) do post :create, url: {
      #   long_url: "an_invalid_url",
      #   short_url: url.short_url
      #   }
      # end

      xit 'does not create a new url' do
        expect(Url.all.count).to eq(0)
      end

      xit { should set_flash[:notice] }
    end
  end

  describe '#update' do
    context 'with valid details' do
      # before(:each) do post :update, user: {
      #   long_url: "https://andela.com",
      #   short_url: "andela"
      # }
      # end

      xit 'redirects to the :details view' do
        expect(response).to redirect_to details_path
      end

      xit 'sets flash with update_success message' do
        it { should set_flash[:notice] }
      end
    end

    context 'with invalid details' do
      # before(:each) do post :update, user: {
      #   long_url: "invalid_url",
      #   short_url: "andela"
      # }
      # end

      xit 're-renders the :edit view' do
        expect(response).to render_template 'edit'
      end

      xit 'sets flash with update_failure message' do
        it { should set_flash[:notice] }
      end
    end
  end

  describe '#redirect_url' do
    context 'when url does not exist' do
      xit 'redirects to the :deleted view' do
      end
    end

    context 'when url is inactive' do
      xit 'redirects to the :inactive view' do
      end
    end

    context 'when url is active' do
      xit 'assigns the short_url from the url params' do
      end

      xit 'finds the short_url in the database table' do
      end

      xit 'redirects to the long_url' do
      end

      xit "increments the url's click_count" do
        # expect(url.click_count).to eq(1)
      end

      xit 'abstracts the statistics of the url visit' do
      end
    end
  end

  describe '#deleted' do
    it 'renders the :deleted view' do
      get :deleted
      expect(response).to render_template 'deleted'
    end
  end

  describe '#inactive' do
    it 'renders the :inactive view' do
      get :inactive
      expect(response).to render_template 'inactive'
    end
  end
end
