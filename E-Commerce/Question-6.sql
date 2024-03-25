select *
from supplier
where supp_id = any (
	select supp_id
	from supplier_pricing
	group by supp_id
	having count(pro_id)>1
);