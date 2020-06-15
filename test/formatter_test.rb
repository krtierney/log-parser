# frozen_string_literal: true

require_relative 'spec_helper'

describe Formatter do
  include SpecHelper
  before do
    @formatter = Formatter.new(parsed_logs)
  end

  describe 'outputs formatted data to the console' do
    it 'prints the aggregated visit total for a page' do
      assert_output(/index 	 6 visits/) do
        @formatter.print_all_results
      end
    end

    it 'prints unique visit counts for a page' do
      assert_output(/home 	 3 unique views/) do
        @formatter.print_all_results
      end
    end
  end
end
