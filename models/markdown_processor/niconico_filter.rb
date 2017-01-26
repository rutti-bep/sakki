class MarkdownProcessor
  class NiconicoFrameFilter < HTML::Pipeline::Filter
    def call
      doc.search('.//text()').each do |node|
        html = node.to_html.gsub(/http:\/\/www\.nicovideo\.jp\/watch\/sm[a-zA-Z0-9_\-]+/) do |movieId|
          niconicoize(movieId[32..-1])
        end
        node.replace(html)
      end
      doc
    end

    def niconicoize(movieId)
      %Q{<script type="text/javascript" src="http://ext.nicovideo.jp/thumb_watch/sm#{movieId}?w=600&h=350"></script><noscript><a href="http://www.nicovideo.jp/watch/sm#{movieId}"></a></noscript>}
    end
  end
end
