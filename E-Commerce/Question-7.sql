select c.cat_id,c.cat_name,m.pro_name,m.min_price
from category as c
inner join(
	select p.cat_id,p.pro_name,min(s.min_price) as min_price
	from product as p
	inner join(
		select pro_id,min(supp_price) as min_price
		from supplier_pricing
		group by pro_id
	) as s on p.pro_id=s.pro_id
	group by p.cat_id
) as m on c.cat_id=m.cat_id;