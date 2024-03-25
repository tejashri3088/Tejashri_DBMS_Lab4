/*creating the procedure*/
DROP PROCEDURE IF EXISTS GetSupplierRatings;

DELIMITER //
CREATE PROCEDURE GetSupplierRatings()
BEGIN
    select s.supp_id,s.supp_name,avg(r.rat_ratstars),
	CASE
		when r.rat_ratstars=5 then "Excellent service"
		when r.rat_ratstars>4 then "Good service"
		when r.rat_ratstars>2 then "Average service"
		else "Poor service"
	END as type_of_service
	from supplier as s,rating as r,`order` as o,supplier_pricing as sp
	where r.ord_id=o.ord_id and sp.pricing_id=o.pricing_id and sp.supp_id=s.supp_id
	group by supp_id;
END//
DELIMITER ;

=======================================

/*calling the procedure*/
call GetSupplierRatings();