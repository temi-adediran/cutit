require "rails_helper"

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
      it "re-renders the page with error" do
        post :create, session: {
          email: "invalid_email@example.com", password: user.password
        }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to include "Invalid email/password combination"
      end
    end

    context "when password is invalid" do
      it "re-renders the new method with error" do
        post :create, session: {
          email: user.email, password: "invalid_password"
        }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to include "Invalid email/password combination"
      end
    end

    context "when authenticating with valid details" do
      it "logs the user in successfully" do
        post :create, session: {
          email: user.email, password: "password"
        }
        expect(session[:user_id]).to eql user.id
        expect(response).to redirect_to dashboard_path
      end
    end
  end

  describe "#destroy" do
    context "when user logs out" do
      it "logs the user out successfully" do
        delete :destroy, session: {
          email: user.email, password: user.password
        }
        expect(session[:user_id]).to eql nil
        expect(response).to redirect_to root_path
      end
    end
  end
end
