use dwtokopaedi;


create table dwtokopaedi.dim_customer (
customer_id integer null,
customer_name varchar(25) null
);

create table dwtokopaedi.dim_payment_method (
payment_method_id integer null,
payment_method_type varchar(25) null
);

create table dwtokopaedi.dim_product_category (
product_category_id integer null,
product_category_name varchar(25) null
);

create table dwtokopaedi.dim_shipping_method (
shipping_method_id integer null,
shipping_method_name varchar(25) null
);

create table dwtokopaedi.dim_location (
location_id integer null,
province varchar(25) null,
regency varchar(25) null
);

create table dwtokopaedi.dim_date (
date_id integer null,
date datetime null,
year varchar(10) null,
month varchar(10) null,
week varchar(10) null,
day varchar(10) null
);

create table dwtokopaedi.tr_order (
tr_order_id integer null,
cust_id integer null,
location_id integer null,
date_id integer null,
product_category_id integer null,
shipping_method_id integer null,
payment_method_id integer null,
total_amount decimal null,
quantity integer null
);

