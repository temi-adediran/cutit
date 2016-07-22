require "rails_helper"

RSpec.feature "Dashboard Url Shortening Process", type: :feature do
  before(:all) do
    @url = build(:url)
    @user = create(:user) 
  end

  feature "User has no links" do
    scenario "Informs User that no url has been created" do 
      fill_login_form(@user.email, "password")

      expect(page).to have_content "No Urls added yet!"
    end
  end

  feature "User enters a valid Url" do
    scenario "displays shortened url on the page" do
      fill_login_form(@user.email, "password")
     
      fill_url_form_dashboard(@url.long_url, @url.short_url)
      
      expect(page).to have_content "Url created successfully."
    end
  end

  feature "User enters an invalid Url" do
    scenario "displays page with errors" do
      fill_login_form(@user.email, "password")

      fill_url_form_dashboard("invalid_url", @url.short_url)

      expect(page).to have_content "Url was not successfully shortened."
    end
  end
end
