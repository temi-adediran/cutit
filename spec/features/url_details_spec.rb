require "rails_helper"

RSpec.feature "Url Show Details Process", type: :feature do
  before(:all) do
    @url = build(:url)
    @user = create(:user) 
  end

  feature "when user clicks details link" do
    scenario "should display url details" do
      fill_login_form(@user.email, "password")
      fill_url_form_dashboard(@url.long_url, @url.short_url)
      click_link("details")

      expect(page).to have_content "Statistics"
    end
  end
end