require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:all) { create(:user) }
  let(:user) { User.last }

  it { should use_before_action(:redirect_to_dashboard) }

  describe "#new" do
    it "renders the right view when user attempts to sign in" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "#create" do
    context "when email is invalid" do
      before(:each) do post :create, session: {
          email: "invalid_email@example.com", password: user.password
        } 
      end

      it "renders the page with error" do
        expect(flash[:alert]).to include "Invalid email/password combination"
      end

      it "renders the login form" do
        expect(response).to render_template(:new)
      end
    end

    context "when password is invalid" do
      before(:each) do post :create, session: {
          email: user.email, password: "invalid_password"
        } 
      end

      it "renders the page with error" do
        expect(flash[:alert]).to include "Invalid email/password combination"
      end

      it "re-renders the new method" do
        expect(response).to render_template(:new)
      end
    end

    context "when authenticating with valid details" do
      before(:each) do post :create, session: {
        email: user.email, password: "password"
      }
      end

      it "logs the user in successfully" do   
        expect(session[:user_id]).to eql user.id
      end

      it "redirects the user to the dashboard" do
        expect(response).to redirect_to dashboard_path
      end
    end
  end

  describe "#destroy" do
    context "when user logs out" do
      before(:each) do delete :destroy, session: {
          email: user.email, password: user.password
        }
      end

      it "logs the user out successfully" do    
        expect(session[:user_id]).to eql nil
      end

      it "redirects the user to the homepage" do
        expect(response).to redirect_to root_path
      end
    end
  end
end
