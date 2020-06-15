# frozen_string_literal: true

require 'simplecov'
require 'minitest/autorun'

SimpleCov.start
Dir['./lib/*.rb'].sort.each { |file| require file }

module SpecHelper
  def parsed_logs
    Parser.new(File.new('./test/test.log')).logged_visits
  end
end
