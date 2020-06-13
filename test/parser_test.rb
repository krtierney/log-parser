# frozen_string_literal: true

require_relative 'spec_helper'

describe Parser do
  before do
    file = File.new('./test/test.log')
    @logs = Parser.new(file).logged_visits
  end

  describe 'logging visits per page' do
    it 'increments the visits from each IP' do
      _(@logs['/index']).must_equal '444.701.448.104' => 5, '1.1.1.1' => 1
    end
  end
end
