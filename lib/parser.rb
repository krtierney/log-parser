# frozen_string_literal: true

class Parser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def build_log_entries
    logged_visits = {}
    @file.each do |line|
      path, source = line.split
      log_visits_by_page(logged_visits, path, source)
    end
    @file.close
    logged_visits
  end

  def logged_visits
    @logged_visits ||= build_log_entries
  end

  private

  def log_visits_by_page(logged_visits, path, source)
    if logged_visits.dig(path, source)
      logged_visits[path][source] += 1
    elsif logged_visits[path]
      logged_visits[path][source] = 1
    else
      logged_visits[path] = { source => 1 }
    end
    logged_visits
  end
end
