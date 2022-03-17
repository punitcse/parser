# frozen_string_literal: true

require_relative 'web_log_parser/web_log_file'
require_relative 'web_log_parser/page_views'
require_relative 'web_log_parser/view'

module WebLogParser
  class WebLogParser
    def initialize(file_path)
      content = WebLogFile.new(file_path).content_by_lines
      @page_views = PageViews.call(content)
      @view = View.new(page_views)
    end

    def call
      if page_views.nil? || page_views.empty?
        puts 'No page visits'
        return
      end

      view.render_each_page_views do |page, views|
        puts "#{page} #{views[:total_views]} visits"
      end

      view.render_each_page_views(unique: true) do |page, views|
        puts "#{page} #{views[:unique_views]} unique views"
      end
    end

    private

    attr_reader :view, :page_views
  end
end
