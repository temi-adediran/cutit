module MessageHelper
  def update_success
    'Url was successfully updated.'
  end

  def update_failure
    'Url was not successfully updated. Please try again!'
  end

  def destroyed
    'Url was successfully destroyed.'
  end

  def invalid_login
    'Invalid email/password combination'
  end

  def short_url
    short_url_url(short_url: @url.short_url)
  end

  def url_success
    'Url created successfully.'
  end

  def url_failure
    'Url was not successfully shortened. Pls enter the correct url format or a new vanity string!'
  end
end
