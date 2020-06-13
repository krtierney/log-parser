# frozen_string_literal: true

class Parser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def build_log_entries
    @logged_visits = {}
    @file.each do |line|
      path, source = line.split
      # log_visit_by_page(path, source)
      @logged_visits[path] = [source]
    end
    @file.close
    @logged_visits
  end

  def logged_visits
    @logged_visits ||= build_log_entries
  end
end
