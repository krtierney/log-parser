# frozen_string_literal: true

require_relative 'stats'

class Formatter
  include Stats

  def initialize(logs)
    @logs = logs
  end

  def print_all_results
    output = "Visits by page: \n"
    visits_by_page(@logs).each do |a|
      output += "#{a.first} \t #{a.last} visits \n"
    end
    puts output
  end
end
