# frozen_string_literal: true

require_relative 'spec_helper'

describe Stats do
  before do
    @logs = Parser.new(File.new('./test/test.log')).logged_visits
    @formatter = Formatter.new(@logs)
  end

  describe '#visits_by_page' do
    it 'returns a 2d array of visit counts per path' do
      _(@formatter.visits_by_page(@logs)).must_be_instance_of Array
    end

    it 'matches expected output for the test log' do
      expected_values = [['/index', 6], ['/help_page/1', 5], ['/home', 3], ['/contact', 3], ['/about', 2]]
      assert_equal(@formatter.visits_by_page(@logs), expected_values)
    end
  end

  describe '#uniques_by_page' do
    it 'detects the number of unique source IPs per page' do
      expected_values = [['/help_page/1', 5], ['/home', 3], ['/about', 2], ['/index', 2], ['/contact', 2]]
      assert_equal(@formatter.uniques_by_page(@logs), expected_values)
    end
  end
end
