module ApplicationHelper
  def page_title(title = '')
    base_title = 'ほんやがたり'
    title.empty? ? base_title : "#{title} | #{base_title}"
  end
end
