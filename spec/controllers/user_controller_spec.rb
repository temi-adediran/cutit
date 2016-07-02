require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) { create(:user) }
  let(:user) { User.first }

  
end
