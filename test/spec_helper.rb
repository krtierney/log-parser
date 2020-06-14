# frozen_string_literal: true

require 'simplecov'
require 'minitest/autorun'

SimpleCov.start
Dir['./lib/*.rb'].sort.each { |file| require file }
