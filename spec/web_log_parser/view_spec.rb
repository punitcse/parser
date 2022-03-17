# frozen_string_literal: true

require 'rspec'
require 'spec_helper'

describe WebLogParser::View do
  let(:page_view) do
    {
      '/about' => { total_views: 3, unique_views: 2 },
      '/help_page/1' => { total_views: 1, unique_views: 1 },
      '/home' => { total_views: 4, unique_views: 3 }
    }
  end

  subject { described_class.new(page_view) }

  it 'raise an error when block is not passed' do
    expect do
      subject.render_each_page_views
    end.to raise_exception(ArgumentError).with_message('No block provided to execute')
  end

  it 'print the total visits' do
    page_view.each do |page, views|
      expect($stdout).to receive(:puts).with("#{page} #{views[:total_views]} visits")
    end
    subject.render_each_page_views { |page, views| puts "#{page} #{views[:total_views]} visits" }
  end

  it 'print the unique visits' do
    page_view.each do |page, views|
      expect($stdout).to receive(:puts).with("#{page} #{views[:unique_views]} views")
    end
    subject.render_each_page_views(unique: true) { |page, views| puts "#{page} #{views[:unique_views]} views" }
  end
end
