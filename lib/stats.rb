# frozen_string_literal: true

module Stats
  def visits_by_page(log)
    log.each_with_object({}) do |(page, _v), h|
      h[page] = log[page].inject(0) { |i, (_k, value)| i + value }
    end.sort_by(&:last)
  end

  def uniques_by_page
    # TO DO
  end
end
