require "rails_helper"

RSpec.feature "Url Shortening Process", type: :feature do
  before(:all) { create(:url) }
  let(:url) { Url.last }

  feature "User enters a valid Url" do
    scenario "displays shortened url on the page" do
      fill_url_form_homepage(url.long_url)

      expect(page).to have_content "Url created successfully."
    end
  end

  feature "User enters an invalid Url" do
    scenario "displays page with errors" do
      fill_url_form_homepage("invalid_url")

      expect(page).to have_content "Url was not successfully shortened."
    end
  end
end
