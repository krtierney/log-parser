# frozen_string_literal: true

require_relative 'spec_helper'

describe Stats do
  include SpecHelper

  before do
    @formatter = Formatter.new(parsed_logs)
  end

  describe '#visits_by_page' do
    it 'tallies the total visits from any IP for a given path' do
      expected_values = [['/index', 6], ['/help_page/1', 5], ['/home', 3], ['/contact', 3], ['/about', 2]]
      assert_equal(@formatter.visits_by_page, expected_values)
    end
  end

  describe '#uniques_by_page' do
    it 'detects the number of unique source IPs per page' do
      expected_values = [['/help_page/1', 5], ['/home', 3], ['/about', 2], ['/index', 2], ['/contact', 2]]
      assert_equal(@formatter.uniques_by_page, expected_values)
    end
  end
end
