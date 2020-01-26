select lpad(m.part,length(m.part)+cast(count(*) as integer)-1 ,'-') as part
from assemblies m, assemblies mm,assemblies w
where m.lft between mm.lft and mm.rgt
and mm.lft between w.lft and w.rgt
group by m.part,m.lft
order by max(m.lft)
;