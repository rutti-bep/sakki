require_relative "markdown_processor/mention_filter"
require_relative "markdown_processor/youtube_filter"
require_relative "markdown_processor/niconico_filter"

class MarkdownProcessor
    FILTERS = [
            HTML::Pipeline::MarkdownFilter,
            HTML::Pipeline::AutolinkFilter,
            MentionFilter,
            YoutubeFrameFilter,
            NiconicoFrameFilter
    ]
    def self.call(text,options = {})
        new(options).call(text)
    end

    def initialize(options = {})
        @options = options
    end

    def call(text)
        pipeline = HTML::Pipeline.new(FILTERS,@options)
        pipeline.call(text)
    end
end
