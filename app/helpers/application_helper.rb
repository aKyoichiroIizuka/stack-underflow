module ApplicationHelper
  def br(s)
    s && h(s).gsub(/(\r\n?)|(\n)/, '<br />').html_safe
  end
  
  def rbr(s)
    s && s.gsub(/(\r\n?)|(\n)/, '<br />').html_safe
  end
end
