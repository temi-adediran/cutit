require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  let(:url) { build(:url) }
  let(:valid_attributes) do
    { url: {
      long_url: url.long_url,
      short_url: url.short_url
      }
    }
  end

  describe "before actions" do 
    it { should use_before_action(:set_url) }
    it { should use_before_action(:redirect_to_dashboard) }
    it { should use_before_action(:redirect_to_root) }
  end  

  describe "#homepage" do
    it "renders the :homepage view" do
      get :homepage
      expect(response).to render_template "homepage"
    end

    xit "populates the recently added links" do     
    end
 
    xit "populates the popular users" do
    end 

    xit "populates the popular links" do
    end
  end

  describe "#details" do
    it "renders the :details view" do
      post :create, valid_attributes
      get :details, id: url
      expect(response).to render_template :details
    end

    xit "assigns the requested url to @url" do
    end

    xit "populates the url's visits to a paginated limit of 10" do
    end
  end 

  describe "#dashboard" do
    it "renders the :dashboard view" do
      session[:user_id] = create(:user).id
      get :dashboard
      expect(response).to render_template :dashboard
    end

    xit "assigns a new Url to @url" do
    end

    xit "populates the user's urls to a paginated limit of 10" do
    end
  end

  describe "#edit" do
    before(:each) { post :create, valid_attributes }

    it "renders the :edit view" do
      get :edit, id: url
      expect(response).to render_template "edit"
    end
  end

  describe "#create" do
    it "permits only the required fields" do
      should permit(:long_url, :short_url)
      .for(:create, params: valid_attributes).on(:url)
    end

    context "with valid details" do
      before(:each) { post :create, valid_attributes }

      it "creates a new url" do
        expect(Url.all.count).to eq(1)
      end

      it { should set_flash[:short_url] }

      it { should set_flash[:notice] } 
    end

    context "with invalid details" do
       before(:each) do post :create, url: {
        long_url: "an_invalid_url",
        short_url: url.short_url
        }
      end

      it "does not create a new url" do
        expect(Url.all.count).to eq(0)
      end

      it { should set_flash[:notice] } 
    end
  end

  describe "#update" do
    context "with valid details" do
      before(:each) do post :update, user: {
        long_url: "https://andela.com",
        short_url: "andela"
      }
      end

      it "redirects to the :details view" do 
        expect(response).to redirect_to details_path
      end

      it "sets flash with update_success message" do 
        it { should set_flash[:notice] } 
      end
    end

    context "with invalid details" do
      before(:each) do post :update, user: {
        long_url: "invalid_url",
        short_url: "andela"
      }
      end
      
      it "re-renders the :edit view" do 
        expect(response).to render_template "edit"
      end

      it "sets flash with update_failure message" do 
        it { should set_flash[:notice] } 
      end
    end
  end

  describe "#redirect_url" do
    context "when url does not exist" do 
      xit "redirects to the :deleted view" do 
      end
    end

    context "when url is inactive" do 
      xit "redirects to the :inactive view" do 
      end
    end

    context "when url is active" do 
      before(:each) { post :create, valid_attributes }

      xit "assigns the short_url from the url params" do
      end

      xit "finds the short_url in the database table" do 
      end

      xit "redirects to the long_url" do 
      end

      it "increments the url's click_count" do 
        expect(url.click_count).to eq(1)
      end

      xit "abstracts the statistics of the url visit" do 
      end
    end
  end

  describe "#deleted" do
    it "renders the :deleted view" do
      get :deleted
      expect(response).to render_template "deleted"
    end
  end

  describe "#inactive" do
    it "renders the :inactive view" do
      get :inactive
      expect(response).to render_template "inactive"
    end
  end
end