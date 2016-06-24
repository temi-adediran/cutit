module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit signup_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign Up'
    end

    def login
      user = create(:user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
  end
end
