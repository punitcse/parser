# frozen_string_literal: true

require 'rspec'
require 'spec_helper'

describe WebLogParser::WebLogFile do
  subject { described_class.new(file_path) }

  context 'file path is empty' do
    let(:file_path) { ' ' }
    it 'raise an error when an empty string passed' do
      expect { subject }.to raise_exception(WebLogParser::FileNotFound)
    end
  end

  context 'file path is incorrect' do
    let(:file_path) { 'some_path/does_not_exist.log' }
    it 'raise file not found error' do
      expect { subject }.to raise_error(WebLogParser::FileNotFound)
    end
  end

  context 'file format is incorrect' do
    let(:file_path) { "#{RSPEC_ROOT}/fixtures/not_an_exe.exe" }
    it 'raise file format invalid error' do
      expect { subject }.to raise_error(WebLogParser::FileFormatIsInvalid)
    end
  end

  context 'when file is valid' do
    let(:file_path) { "#{RSPEC_ROOT}/fixtures/webserver.log" }
    let(:content_by_lines) { subject.content_by_lines }

    it 'gets all the content line by line' do
      expect(content_by_lines.size).to eq(500)
    end

    it 'return content in correct order and remove new line characters' do
      expect(content_by_lines.first).to eq('/help_page/1 126.318.035.038')
      expect(content_by_lines[1]).to eq('/contact 184.123.665.067')
      expect(content_by_lines[2]).to eq('/home 184.123.665.067')
      expect(content_by_lines[3]).to eq('/about/2 444.701.448.104')
      expect(content_by_lines.last).to eq('/about 543.910.244.929')
    end
  end
end
