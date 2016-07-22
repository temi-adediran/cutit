require "rails_helper"

RSpec.feature "Logout Process", type: :feature do
  before(:all) { @user = create(:user) }

  feature "when user clicks logout button" do
    scenario "should log out user" do
      fill_login_form(@user.email, "password")
      
      click_link("Log Out")

      expect(page).to have_content "Log In"
    end
  end
end