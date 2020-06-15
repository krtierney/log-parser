# frozen_string_literal: true

module Stats
  def visits_by_page
    @logs.each_with_object({}) do |(page, _v), h|
      h[page] = @logs[page].inject(0) { |i, (_k, value)| i + value }
    end.sort_by(&:last).reverse
  end

  def uniques_by_page
    @logs.transform_values(&:count).sort_by(&:last).reverse
  end
end
