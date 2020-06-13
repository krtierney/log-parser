# frozen_string_literal: true

require_relative 'spec_helper'

describe Parser do
  before do
    file = File.new('./webserver.log')
    @parser = Parser.new(file)
  end

  it 'parses a file into log entries with a path and source IP' do
    logs = @parser.logged_visits

    _(logs['/help_page/1']).must_equal ['200.017.277.774']
  end
end
