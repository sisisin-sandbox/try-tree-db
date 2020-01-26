class CreateWeightCalcFn < ActiveRecord::Migration[6.0]
  def change
    sql=<<~SQL
    create function WgtCalc2(my_part in CHAR)
    RETURNS integer as $$
    declare
      rtn_wgt integer := 0;
    begin
      select coalesce(
        sum(sub.qty
          * case when sub.lft+1=sub.rgt
          then sub.wgt
          else WgtCalc2(sub.part) end),
        max(frammis.wgt)) into rtn_wgt
      from frammis
      left join frammis sub on frammis.lft < sub.lft
      and frammis.rgt > sub.rgt
      and not exists (
        select * from frammis f
        where f.lft<sub.lft and f.lft>frammis.lft
        and f.rgt>sub.rgt
        and f.rgt<frammis.rgt)
      where frammis.part=my_part;

      RETURN rtn_wgt;
    end;
    $$ language plpgsql;
    SQL
    ActiveRecord::Base.connection.execute(sql)
  end
end
