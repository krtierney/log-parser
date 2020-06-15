# frozen_string_literal: true

require_relative 'spec_helper'

describe Parser do
  include SpecHelper

  describe 'logging visits per page' do
    it 'increments the visits from each IP' do
      _(parsed_logs['/index']).must_equal '444.701.448.104' => 5, '1.1.1.1' => 1
    end
  end
end
