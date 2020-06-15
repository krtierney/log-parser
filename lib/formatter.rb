# frozen_string_literal: true

require_relative 'stats'

class Formatter
  include Stats

  def initialize(logs)
    @logs = logs
  end

  def print_all_results
    puts format_visits_by_page
    puts "\n\n"
    puts format_uniques_by_page
  end

  private

  def format_visits_by_page
    output = "Visits by page: \n"
    visits_by_page.each do |a|
      output += "#{a.first} \t #{a.last} visits \n"
    end
    output
  end

  def format_uniques_by_page
    output = "Unique views by page: \n"
    uniques_by_page.each do |a|
      output += "#{a.first} \t #{a.last} unique views \n"
    end
    output
  end
end
