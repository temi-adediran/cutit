require "rails_helper"

RSpec.describe "Signup process", type: :feature do
  let(:user) { build :user }

  feature "when form is filled with correct inputs" do
    scenario "should sign user up" do
      signup_helper(
        user.username,
        user.email,
        "password",
        "password"
      )

      expect(page).to have_content "Welcome, #{user.username}"
    end
  end

  feature "when user enters an invalid email"
    scenario 'should not sign user up' do
      signup_helper(
        user.username,
        "invalid_email",
        "password",
        "password"
      )

      expect(page).to have_no_content "Welcome, #{user.username}"
    end

  feature "when at least an input is not present" do
    scenario "should not sign user up" do
      signup_helper(
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
      signup_helper(
        user.username,
        nil,
        "password",
        "different_password"
      )

      expect(page).to have_no_content "Welcome, #{user.username}"
    end
  end

  feature "when user intends to signin" do
    scenario "should link login page" do
      visit new_user_path
      click_link "Log in now!"

      expect(page).to have_content "Log in"
    end
  end
end
