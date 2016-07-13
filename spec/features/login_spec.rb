require 'rails_helper'

RSpec.feature 'Login Process', type: :feature do
  before(:all) { create(:user) }
  let(:user) { User.last }

  feature 'when user enters correct inputs' do
    scenario 'should log in user' do
      fill_login_form(user.email, 'password')

      expect(page).to have_content "Welcome, #{user.username}"
    end
  end

  feature 'when inputs are incorrect' do
    scenario 'should not sign user in' do
      fill_login_form(user.email, 'wrong_password')

      expect(page).to have_content 'Invalid email/password combination'
    end
  end

  feature 'when user intends to sign up' do
    scenario 'should link sign up page' do
      visit login_path
      click_link 'Sign up now!'

      expect(page).to have_content 'Sign up'
    end
  end

  feature 'when at least an input is not present' do
    scenario 'should not sign user in' do
      fill_login_form(
        user.email,
        nil
      )

      expect(page).to have_no_content "Welcome, #{user.username}"
    end
  end
end
