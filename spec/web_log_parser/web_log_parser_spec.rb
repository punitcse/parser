# frozen_string_literal: true

require 'rspec'
require 'spec_helper'

describe WebLogParser::WebLogParser do
  subject { described_class.new(file_path).call }
  let(:file_path) { "#{RSPEC_ROOT}/fixtures/webserver.log" }

  context 'when file is not present' do
    let(:file_path) { "#{RSPEC_ROOT}/fixtures/imaginary_file.log" }

    it 'raise an error' do
      expect { subject }.to raise_exception(WebLogParser::FileNotFound)
    end
  end

  context 'when file is empty' do
    let(:file_path) { "#{RSPEC_ROOT}/fixtures/webserver_empty.log" }

    it 'print no page visits' do
      expect($stdout).to receive(:puts).with('No page visits')
      expect { subject }.to_not raise_exception
    end
  end

  context 'when file is valid' do
    let(:page_visits) do
      [
        '/about/2 90 visits',
        '/contact 89 visits',
        '/index 82 visits',
        '/about 81 visits',
        '/help_page/1 80 visits',
        '/home 78 visits',
        '/help_page/1 23 unique views',
        '/contact 23 unique views',
        '/home 23 unique views',
        '/index 23 unique views',
        '/about/2 22 unique views',
        '/about 21 unique views'
      ]
    end

    it 'prints the page visits and unique views in descending order' do
      page_visits.each do |page_visit_print|
        expect($stdout).to receive(:puts).with(page_visit_print)
      end
      expect { subject }.to_not raise_exception
    end
  end
end
