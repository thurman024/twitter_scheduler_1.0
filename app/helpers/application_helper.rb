module ApplicationHelper
  def format_time(t)
    t.strftime("%B %-d, %Y at %-I:%M%p")
  end
end
