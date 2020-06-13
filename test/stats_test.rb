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
      expected_values = [['/about', 2], ['/contact', 3], ['/home', 3], ['/help_page/1', 5], ['/index', 6]]
      assert_equal(@formatter.visits_by_page(@logs), expected_values)
    end
  end
end
