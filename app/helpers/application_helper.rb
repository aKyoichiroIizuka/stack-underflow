module ApplicationHelper
  def br(s)
	  s && h(s).gsub(/(\r\n?)|(\n)/, '<br />').html_safe
  end
  
  def rbr(s)
	  s && s.gsub(/(\r\n?)|(\n)/, '<br />').html_safe
  end

  def abbr(s, len = 30)
	  if s.length > len
	  	s[0..len - 1] + "..."
	  else
      s
	  end
  end
end
