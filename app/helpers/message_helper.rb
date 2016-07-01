module MessageHelper
  def updated
    "Url was successfully updated."
  end

  def destroyed
    "Url was successfully destroyed."
  end

  def invalid_login
    "Invalid email/password combination"
  end

  def short_url
    "#{root_url}#{@url.short_url}"
  end

  def url_success
    "Url created successfully! Log in to have your url saved."
  end

  def url_failure
    "Url was not successfully created. Please confirm it's in url format"
  end
end