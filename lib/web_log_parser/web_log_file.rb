# frozen_string_literal: true

module WebLogParser
  class WebLogFile
    class FileNotFound < ArgumentError
      def message
        'File path does not exists. Please check the file path.'
      end
    end

    class FileFormatIsInvalid < ArgumentError
      def message
        'Only support `.log` format. All other formats are invalid'
      end
    end

    attr_reader :content_by_lines

    def initialize(path)
      @path = path.strip
      raise FileNotFound unless File.file?(path)
      raise FileFormatIsInvalid unless File.extname(path) == '.log'

      @content_by_lines = []
      File.foreach(path) do |line|
        content = line.strip
        @content_by_lines << content unless content.empty?
      end
    end
    private

    attr_accessor :path
  end
end
