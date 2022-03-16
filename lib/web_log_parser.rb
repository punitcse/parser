# frozen_string_literal: true

module WebLogParser
  class WebLogParser
    def initialize(file_path)
      content = WebLogFile.new(file_path).content_by_lines
      views = PageViews.call(content)
      puts views
    end


  end
end
