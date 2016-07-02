require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) { create(:user) }
  let(:user) { User.first }

  describe "#new" do
    it "renders the right view when user attempts to sign up" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "#create" do
  end
end
