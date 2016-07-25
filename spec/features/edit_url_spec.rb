require "rails_helper"

RSpec.feature "Edit Url Process", type: :feature do
  before(:all) do
    @url = build(:url)
    @user = create(:user) 
  end

  feature "User enters a valid Url" do
    scenario "displays shortened url on the page" do
      fill_login_form(@user.email, "password")
     
      fill_url_form_dashboard(@url.long_url, @url.short_url)

      fill_url_edit_form("https://andela.com", "slug")
      
      expect(page).to have_content "Short url: slug"
    end
  end

  feature "User enters an invalid Url" do
    scenario "displays page with errors" do
      fill_login_form(@user.email, "password")

      fill_url_form_dashboard(@url.long_url, @url.short_url)

      fill_url_edit_form("invalid", "slug")


      expect(page).to have_content "Long url is invalid"
    end
  end
end
