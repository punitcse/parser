# frozen_string_literal: true

module WebLogParser
  class View
    def initialize(page_views)
      return if page_views.nil? || page_views.empty?

      @page_views = page_views.sort_by { |_, views| - views[:total_views] }
      @unique_page_views = page_views.sort_by { |_, views| - views[:unique_views] }
    end

    def render_each_page_views(unique: false, &block)
      unless block_given?
        raise ArgumentError,
              'No block provided to execute'
      end

      unique ? unique_page_views.each(&block) : page_views.each(&block)
    end

    private

    attr_accessor :page_views, :unique_page_views
  end
end
