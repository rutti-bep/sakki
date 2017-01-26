class MarkdownProcessor
  class YoutubeFrameFilter < HTML::Pipeline::Filter
    def call
      doc.search('.//text()').each do |node|
        html = node.to_html.gsub(/https:\/\/www\.youtube\.com\/watch\?v=[a-zA-Z0-9_\-]+/) do |movieId|
          youtubize(movieId[32..-1])
        end
        node.replace(html)
      end
      doc
    end

    def youtubize(movieId)
      %Q{<iframe width="600" height="350" src="https://www.youtube.com/embed/#{movieId}" frameborder="0" allowfullscreen></iframe>}
    end
  end
end
