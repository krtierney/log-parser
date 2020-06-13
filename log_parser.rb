# frozen_string_literal: true

require_relative 'lib/parser'
require_relative 'lib/formatter'

class LogParser
  def self.call(args)
    raise ArgumentError, 'A single file input is required' unless args.one?

    @logs ||= parse_log(args.first)
    print_stats_for(@logs)
  end

  def self.parse_log(file)
    Parser.new(File.new(file)).logged_visits
  end

  def self.print_stats_for(log)
    Formatter.new(log).print_all_results
  end
end

LogParser.call(ARGV)
