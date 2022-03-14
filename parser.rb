#!/usr/bin/env ruby
# frozen_string_literal: true

file_path = ARGV[0]
Parser.new(file_path).call
