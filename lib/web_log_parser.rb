# frozen_string_literal: true

module WebLogParser
  class Parser
    attr_accessor :path

    def initialize(file_path)
      @path = file_path.strip
      raise ArgumentError, 'No file path is provided' if path.empty?
    end

    def call

    end
  end
end
