create table dim_payment_method
(
    dim_payment_method_id        bigint      not null
        primary key,
    version                      int         null,
    date_from                    datetime    null,
    date_to                      datetime    null,
    payment_method_id            bigint      null,
    payment_method_type          varchar(15) null,
    payment_method_name          varchar(16) null,
    paymen_method_account_number bigint      null,
    payment_method_fee           bigint      null
);

create index idx_dim_payment_method_lookup
    on dim_payment_method (payment_method_id);

create index idx_dim_payment_method_tk
    on dim_payment_method (dim_payment_method_id);

create table dim_products
(
    dim_products_id bigint      not null
        primary key,
    version         int         null,
    date_from       datetime    null,
    date_to         datetime    null,
    product_id      bigint      null,
    product_stock   bigint      null,
    product_name    varchar(33) null,
    product_price   bigint      null,
    product_type    varchar(19) null,
    product_image   varchar(30) null
);

create index idx_dim_products_lookup
    on dim_products (product_id);

create index idx_dim_products_tk
    on dim_products (dim_products_id);

create table dim_shipping_status
(
    dim_shipping_status_id bigint      not null
        primary key,
    version                int         null,
    date_from              datetime    null,
    date_to                datetime    null,
    shipping_status_id     bigint      null,
    shipping_status_name   varchar(10) null
);

create index idx_dim_shipping_status_lookup
    on dim_shipping_status (shipping_status_id);

create index idx_dim_shipping_status_tk
    on dim_shipping_status (dim_shipping_status_id);

create table dim_user
(
    dim_user_id     bigint      not null
        primary key,
    version         int         null,
    date_from       datetime    null,
    date_to         datetime    null,
    user_id         bigint      null,
    user_first_name varchar(9)  null,
    user_last_name  varchar(11) null,
    user_phone      varchar(15) null,
    user_address    varchar(18) null,
    user_city       varchar(10) null,
    user_province   varchar(26) null,
    user_email      varchar(22) null,
    user_username   varchar(13) null,
    user_password   varchar(12) null
);

create index idx_dim_user_lookup
    on dim_user (user_id);

create index idx_dim_user_tk
    on dim_user (dim_user_id);

create table tr_order
(
    tr_order_id            varchar(15) null,
    date_purchase          varchar(20) null,
    date_shipping          varchar(20) null,
    quantity_item          int         null,
    total                  decimal     null,
    dim_user_id            int         null,
    dim_products_id        int         null,
    dim_shipping_status_id int         null,
    dim_payment_method_id  int         null
);

