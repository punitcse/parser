require 'rspec'
require 'spec_helper'
describe WebLogParser::Parser do
  subject { described_class.new(file_path).call }

  context 'file path is empty' do
    let(:file_path) { ' ' }
    it 'raise an error when an empty string passed' do
      expect { subject }.to raise_error('No file path is provided')
    end
  end

  context 'file path is incorrect' do
    let(:file_path) { 'abc/def' }
    it 'raise an error when an empty string passed' do
      expect { subject }.to raise_error('No file path is provided')
    end
  end
end
