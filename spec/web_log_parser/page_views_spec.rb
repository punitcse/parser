# frozen_string_literal: true

require 'rspec'
require 'spec_helper'

describe WebLogParser::PageViews do
  subject { described_class.call(content_by_lines) }

  context 'when there\'s no content' do
    let(:content_by_lines) { [] }

    it 'return nil' do
      expect(subject).to be_nil
    end
  end

  context 'when content is present' do
    let(:content_by_lines) do
      [
        '/help_page/1 126.318.035.038',
        '/home 184.123.665.067',
        '/home 197.123.665.067',
        '/home 123.123.231.111',
        '/home 184.123.665.067',
        '/about 126.318.035.038',
        '/about 126.318.035.038',
        '/about 123.123.231.111'
      ]
    end

    it 'returns a data structure that contains all page views, unique page views and IP addresses' do
      expect(subject).to eq(
        '/about' => { total_views: 3, unique_views: 2, ip_addresses: Set.new(%w[126.318.035.038 123.123.231.111]) },
        '/help_page/1' => { total_views: 1, unique_views: 1, ip_addresses: Set.new(%w[126.318.035.038]) },
        '/home' => { total_views: 4, unique_views: 3,
                     ip_addresses: Set.new(%w[184.123.665.067 197.123.665.067 123.123.231.111]) }
      )
    end
  end
end
