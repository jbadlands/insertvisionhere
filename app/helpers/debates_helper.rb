module DebatesHelper

def debate_resource_html(url = nil)
	
	case url
	when /youtube.com/
		id	=	url.split(/=/).map do |i| #regular expression to retrieve just the video id
					t = i.split(/&/)
				end
		
		"<object width='425' height='344'><param name='movie' value='http://www.youtube.com/v/#{id[1][0]}'></param><param name='allowFullScreen' value='true'></param><param name='allowscriptaccess' value='always'></param><embed src='http://www.youtube.com/v/#{id[1][0]}' type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true' width='425' height='344'></embed></object>"
		
	when /vimeo.com/
		id	=	url.split("/")-[""].map do |i| #regular expression to retrieve just the video id
					t = i.split(/&/)
				end
		
		"<object width='400' height='225'><param name='allowfullscreen' value='true' /><param name='allowscriptaccess' value='always' /><param name='movie' value='http://vimeo.com/moogaloop.swf?clip_id=#{id[3]}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1' /><embed src='http://vimeo.com/moogaloop.swf?clip_id=#{id[3]}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1' type='application/x-shockwave-flash' allowfullscreen='true' allowscriptaccess='always' width='400' height='225'></embed></object>"
		
	else
		"<a href='#{url}' title='#{url}' id='debate_resource'>#{url}</a>"
	end
end

end
