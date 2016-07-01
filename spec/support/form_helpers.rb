module FormHelpers
  def signup_helper(username, email, password, password_confirmation)
    visit new_user_path
    within("#new_user") do
      fill_in "Username", with: username
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Confirm Password", with: password_confirmation
    end
    submit_form
  end

  def login_helper(email, password)
    visit login_path
    within("#login_form") do
      fill_in "Email", with: email
      fill_in "Password", with: password
    end
    submit_form
  end

  def submit_form
    find('input[name="commit"]').click
  end
end
