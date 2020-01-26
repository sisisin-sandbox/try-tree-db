class CreateFrammis < ActiveRecord::Migration[6.0]
  def change
    sql=<<~SQL
    create table frammis(
      part char(2) primary key,
      qty integer not null constraint positive_qty check (qty > 0),
      wgt integer default 0 not null constraint non_negative_wgt check ((wgt=0 and rgt-lft > 1) or (wgt >0 and rgt-lft=1)),
      lft integer not null unique constraint valid_lft check (lft>0),
      rgt integer not null unique constraint valid_rgt check (rgt>1), constraint valid_range_pair check (lft<rgt)
    );    
    SQL
    ActiveRecord::Base.connection.execute(sql)
  end
end
