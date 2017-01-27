class MarkdownProcessor
  class ImageFilter < HTML::Pipeline::Filter
    def call
      doc.search('.//text()').each do |node|
        html = node.to_html.gsub(/(http|https):\/\/.+\.(jpg|png)/) do |imageUrl|
          imagize(imageUrl)
        end
        node.replace(html)
      end
      doc
    end

    def imagize(imageUrl)
      %Q{<img src="#{imageUrl}">}
    end
  end
end
