require 'rails_helper'

RSpec.feature 'VisitorSignUps', type: :feature do
  scenario 'with valid email and password' do
    sign_up_with 'temitope.fowotade@andela.com', 'mypassword'

    expect(page).to have_content('Log Out')
  end

  scenario 'with invalid email' do
    sign_up_with 'temitope.fowotade', 'mypassword'

    expect(page).to have_content('Log In')
  end

  scenario 'with blank password' do
    sign_up_with 'temitope.fowotade@andela.com', ''

    expect(page).to have_content('Log In')
  end

  def sign_up_with(email, password)
    visit signup_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign Up'
  end
end
