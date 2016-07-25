require "rails_helper"

RSpec.describe "Signup process", type: :feature do
  let(:user) { build :user }

  feature "when form is filled with correct inputs" do
    scenario "should sign user up" do
      fill_signup_form(
        user.username,
        user.email,
        "password",
        "password"
      )

      expect(page).to have_content "Welcome, #{user.username}"
    end
  end

  feature "when at least an input is not present" do
    scenario "should not sign user up" do
      fill_signup_form(
        user.username,
        nil,
        "password",
        "password"
      )

      expect(page).to have_no_content "Welcome, #{user.username}"
    end
  end

  feature "when password and password confirmation inputs are not the same" do
    scenario "should not sign user up" do
      fill_signup_form(
        user.username,
        nil,
        "password",
        "different_password"
      )

      expect(page).to have_no_content "Welcome, #{user.username}"
    end
  end

  feature "when user intends to signup" do
    scenario "should link signup page" do
      visit signup_path
      click_link "Log in now!"

      expect(page).to have_content "Log in"
    end
  end
end
