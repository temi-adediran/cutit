require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { build(:user) }
  let(:valid_attributes) do
    { user: {
        username: user.username,
        email: user.email, 
        password: "password",
        password_confirmation: "password"
      }
    }
  end

  it { should use_before_action(:redirect_to_dashboard) }

  describe "#new" do
    it "renders the right view when user attempts to sign up" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "#create" do
    context "with valid details" do 
      before(:each){ post :create, valid_attributes }
      
      it "creates a new user" do
        expect(User.all.count).to eq(1)
      end

      it "logs the user in successfully" do
        expect(session[:user_id]).to eq(assigns(:user).id)
      end

      it "redirects to the user dashboard" do
        expect(response).to redirect_to dashboard_path
      end
    end

    context "with invalid details" do
      before(:each) do post :create, user: {
          username: user.username, 
          email: nil,
          password: user.password, 
          password_confirmation: user.password
        } 
      end

      it "does not create a new user" do
        expect { User.create }.to_not change{User.count}
      end

      it "re-renders the new method" do
        expect(response).to render_template(:new)
      end
    end

    it "permits only the required fields" do
      should permit(:username, :email, :password, :password_confirmation)
      .for(:create, params: valid_attributes).on(:user)
    end
  end
end
