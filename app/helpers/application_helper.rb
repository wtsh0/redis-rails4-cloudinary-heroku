module ApplicationHelper
  def for_css
    controller_path.gsub(/\//, "-")
  end
end
