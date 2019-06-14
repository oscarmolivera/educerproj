module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Educerproj"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end
  def active?(page)
    "active" if current_page?(page)
  end
end
