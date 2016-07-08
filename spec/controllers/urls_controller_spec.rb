require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  before(:each) { create(:url) }
  let(:url) { Url.first }

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
      get :details
      expect(response).to render_template "details" 
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
    it "renders the :edit view" do
      get :edit
      expect(response).to render_template "edit"
    end
  end

  describe "#create" do
    xit "permits only the required fields" do
    end

    context "with valid details" do
      before(:each) do post :create, url: {
        long_url: url.long_url,
        short_url: url.short_url
        }
      end

      it "creates a new url" do
        expect { Url.create }.to change(Url.count).by(1)
      end

      xit "sets flash with the short url" do
      end

      xit "sets flash with success message" do 
      end
    end

    context "with invalid details" do
       before(:each) do post :create, url: {
        long_url: "an.invalid_url",
        short_url: url.short_url
        }
      end

      it "does not create a new url" do
        expect { Url.create }.to_not change{ Url.count }.by(1)
      end

      xit "sets flash with the failure message" do 
      end
    end
  end

  describe "#update" do
    context "with valid details" do
      xit "redirects to the :details view" do 
      end

      xit "sets flash with update_success message" do 
      end
    end

    context "with invalid details" do
      xit "re-renders the :edit view" do 
      end

      xit "sets flash with update_failure message" do 
      end
    end
  end

  describe "#redirect_url" do
    xit "assigns the short_url from the url params" do
    end

    xit "finds the short_url in the database table" do 
    end

    context "when url does not exist" do 
      xit "redirects to the :deleted view" do 
      end
    end

    context "when url is inactive" do 
      xit "redirects to the :inactive view" do 
      end
    end

    context "when url is active" do 
      xit "redirects to the long_url" do 
      end

      xit "increments the url's click_count" do 
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
    xit "renders the :inactive view" do
    end
  end

  describe "before actions" do 
    it { should use_before_action(:set_url) }
    it { should use_before_action(:redirect_to_dashboard) }
    it { should use_before_action(:redirect_to_root) }
  end  
end
