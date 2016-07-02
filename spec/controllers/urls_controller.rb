require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  before(:each) { create(:url) }
  let(:url) { Url.first }

   
end
