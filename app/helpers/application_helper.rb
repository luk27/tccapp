module ApplicationHelper

include TweetButton

          def facebook_like
            content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=standard&show_faces=true&width=450&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like, :width => 300, :height => 90
            
          end

  def title
    base_title = "TCC-APP"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  def logo
    image_tag("logotcc.png", :alt => "TCC-APP", :class => "round")
  end
  
\

end
