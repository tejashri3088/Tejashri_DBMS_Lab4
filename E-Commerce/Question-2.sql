create table if not exists supplier(
supp_id int primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null
);

create table if not exists customer(
cus_id int primary key,
cus_name varchar(20) not null,
cus_phone varchar(10) not null,
cus_city varchar(30) not null,
cus_gender char
);

create table if not exists category(
cat_id int primary key,
cat_name varchar(20) not null
);

create table if not exists product(
pro_id int primary key,
pro_name varchar(20) not null default "dummy",
pro_desc varchar(60),
cat_id int,
foreign key (cat_id) references category(cat_id)
);

create table if not exists supplier_pricing(
pricing_id int primary key,
pro_id int,
supp_id int,
supp_price int default 0,
foreign key (pro_id) references product(pro_id),
foreign key (supp_id) references supplier(supp_id)
);

create table if not exists `order`(
ord_id int primary key,
ord_amount int not null,
ord_date date not null,
cus_id int,
pricing_id int,
foreign key (cus_id) references customer(cus_id),
foreign key (pricing_id) references supplier_pricing(pricing_id)
);

create table if not exists rating(
rat_id int primary key,
ord_id int,
rat_ratstars int not null,
foreign key (ord_id) references `order`(ord_id)
);