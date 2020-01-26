class Frammis < ApplicationRecord
  self.table_name = 'frammis'

  class << self
    def calc_weight(part)
      select(sanitize_sql_array(["WgtCalc2(?)", part]))
    end

    def find_nd(numer, denom)
      ret_num=numer.to_d+1
      ret_den=2*denom

      while (ret_num/2).floor == ret_num/2
        ret_num = ret_num/2
        ret_den = ret_den/2
      end

      [ret_num.to_i,ret_den]
    end

    def find_y_nd(numer,denom)
      num,den = find_nd(numer,denom).map(&:to_d)
      
      while den < denom
        num = 2*num
        den = 2 * den
      end
      num=numer-num

      while (num/2).floor == num/2
        num=num/2
        den=den/2
      end

      [num.to_i,den.to_i]
    end

    def find_xy(numer,denom)
      x_n,x_d=find_nd(numer,denom)
      y_n,y_d=find_y_nd(numer,denom)
      ["#{x_n}/#{x_d}","#{y_n}/#{y_d}"]
    end
  end
end
