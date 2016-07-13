module FormHelpers
  def fill_signup_form(username, email, password, password_confirmation)
    visit signup_path
    within('#new_user') do
      fill_in 'Username', with: username
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Confirm Password', with: password_confirmation
    end
    submit_form
  end

  def fill_login_form(email, password)
    visit login_path
    within('#login_form') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    submit_form
  end

  def fill_url_form_homepage(long_url)
    within ('#url_form') do
      fill_in 'url_long_url', with: long_url
    end
    click_button('Cutit')
  end

  def fill_url_form_dashboard(long_url, vanity_string)
    within ('#user_url_form') do
      fill_in 'url_long_url', with: long_url
      fill_in 'url_short_url', with: vanity_string
    end
    click_link('Cutit')
  end

  def submit_form
    find('input[name="commit"]').click
  end
end
