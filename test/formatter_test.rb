# frozen_string_literal: true

require_relative 'spec_helper'

describe Formatter do
  before do
    logs = Parser.new(File.new('./webserver.log'))
    @formatter = Formatter.new(logs)
  end

  it 'outputs to the console' do
    _(@formatter.print_all_results).must_equal 'Crunching the numbers...'
  end
end
