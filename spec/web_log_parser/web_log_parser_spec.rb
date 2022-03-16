require 'rspec'
require 'spec_helper'

describe WebLogParser::WebLogParser do
  subject { described_class.new(file_path) }
  let(:file_path) { "#{RSPEC_ROOT}/fixtures/webserver.log" }

  context 'return page views' do
    it {subject}
  end
end
