# frozen_string_literal: true

require 'set'
module WebLogParser
  class PageViews
    # @param [Array] content_by_lines
    # @return [Hash]
    def self.call(content_by_lines = [])
      return if content_by_lines.empty?

      content_by_lines.each_with_object({}) do |line, logs|
        page, ip_address = line.split.each(&:to_sym)

        if logs[page]
          logs[page][:ip_addresses].add(ip_address)
          logs[page][:total_views] += 1
        else
          logs[page] = { total_views: 1, ip_addresses: Set.new([ip_address]) }
        end
        logs[page][:unique_views] = logs[page][:ip_addresses].size
      end
    end
  end
end
