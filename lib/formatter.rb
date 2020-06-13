# frozen_string_literal: true

require_relative 'stats'

class Formatter
  include Stats

  def initialize(logs)
    @logs = logs
  end

  def print_all_results
    p 'Crunching the numbers...'

    # visits_by_page(@logs)
  end
end
