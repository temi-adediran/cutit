class MessageService
  def self.update_success
    "Url was successfully updated."
  end

  def self.update_failure
    "Url was not successfully updated. Please try again!"
  end

  def self.destroyed
    "Url was successfully destroyed."
  end

  def self.invalid_login
    "Invalid email/password combination"
  end

  def self.url_success
    "Url created successfully."
  end

  def self.url_failure
    "Url was not successfully shortened. 
    Pls enter the correct url format or a new vanity string!" 
  end
end
