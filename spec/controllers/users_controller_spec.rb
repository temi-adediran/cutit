require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { build(:user) }
  let(:valid_attributes) do
    {
      user:
      {
        username: user.username,
        email: user.email,
        password: "password",
        password_confirmation: "password"
      }
    }
  end

  let(:invalid_attributes) do
    {
      user:
      {
        username: user.username,
        email: nil,
        password: "password",
        password_confirmation: "invalid_password"
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
      it "creates a new user" do
        expect { post :create, valid_attributes }.to change(User, :count).by(1)
      end

      it "logs in user successfully and redirects to the dashboard" do
        post :create, valid_attributes
        expect(session[:user_id]).to eq(assigns(:user).id)
        expect(response).to redirect_to dashboard_path
      end
    end

    context "with invalid details" do
      it "does not create a new user" do
        expect { post :create, invalid_attributes }.to_not change { User.all.count }
      end

      it "re-renders the new method" do
        post :create, invalid_attributes
        expect(response).to render_template(:new)
      end
    end

    it "permits only the required fields" do
      should permit(
        :username, 
        :email, 
        :password, 
        :password_confirmation
        )
        .for(:create, params: valid_attributes).on(:user)
    end
  end
end
