select pro_id,pro_name
from product
where pro_id = any(
	select pro_id
	from supplier_pricing
	where pricing_id = any(
		select pricing_id
		from `order`
		where ord_date>"2021-10-05"
	)
);