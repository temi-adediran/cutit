require 'rails_helper'

RSpec.feature "Url Shortener", type: :feature do
  before(:all) { create(:url) }
  let(:url) { Url.last }

  feature "User creates a short url" do
    scenario "displays shortened url on the page" do
      visit root_path
      fill_url_form_homepage(url.long_url)

      expect(page).to have_content "Url created successfully."
    end
  end
end
