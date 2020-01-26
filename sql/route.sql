select children.emp,count(*) as lvl
from orgchart parents,orgchart children
where children.lft between parents.lft and parents.rgt
group by children.emp, children.lft
order by lvl,children.lft
;
