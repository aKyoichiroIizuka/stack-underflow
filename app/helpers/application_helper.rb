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

  def markdown(s)
    renderer = Redcarpet::Render::HTML.new({filter_html: true, hard_wrap: true})
    options = {autolink: true, no_intra_emphasis: true, fenced_code: true, gh_blockcode: true}
    return Redcarpet::Markdown.new(renderer, options).render(s).html_safe
  end
end
