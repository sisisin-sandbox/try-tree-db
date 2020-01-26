class Frammis < ApplicationRecord
  self.table_name = 'frammis'

  class << self
    def calc_weight(part)
      select(sanitize_sql_array(["WgtCalc2(?)", part]))
    end
  end
end
