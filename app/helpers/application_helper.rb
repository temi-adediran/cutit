module ApplicationHelper
  def friendly_date(d)
    d.strftime("%B %e, %Y")
  end

  def class_name
    if current_page?("/")
      "homepage"
    elsif current_page?("/dashboard")
      "dashboard"
    end
  end
end
