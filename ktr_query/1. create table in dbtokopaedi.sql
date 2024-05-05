use dbtokopaedi;

 create table dbtokopaedi.location
(
    location_id           int auto_increment        not null primary key,
    location_province     varchar(30) null,
    location_regency      varchar(30) null,
    location_sub_district varchar(30) null,
    urban_district        varchar(30) null,
    location_postal_code  varchar(10) null
);

create table dbtokopaedi.payment_method
(
    payment_method_id             int auto_increment         not null
        primary key,
    payment_method_type           varchar(30) null,
    payment_method_name           varchar(30) null,
    payment_method_account_number varchar(30) null,
    payment_method_fee            decimal     null
);

create table dbtokopaedi.product_category
(
    product_category_id   int auto_increment         not null
        primary key,
    product_category_name varchar(40) null
);

create table dbtokopaedi.product_sub_category
(
    product_sub_category_id   int auto_increment
        primary key,
    product_category_id       int         null,
    product_sub_category_name varchar(40) null,
    constraint product_sub_category_product_category_product_category_id_fk
        foreign key (product_category_id) references dbtokopaedi.product_category (product_category_id)
);

create table dbtokopaedi.product_detail
(
    product_detail_id       int auto_increment
        primary key,
    product_sub_category_id int         null,
    product_price           decimal     null,
    product_name            varchar(40) null,
    product_image           varchar(40) null,
    product_stock           int         null,
    constraint product_detail_product_sub_category_product_sub_category_id_fk
        foreign key (product_sub_category_id) references dbtokopaedi.product_sub_category (product_sub_category_id)
);

create table dbtokopaedi.shipping_method
(
    shipping_method_id   int auto_increment         not null
        primary key,
    shipping_method_name varchar(20) null,
    shipping_method_cost decimal     null
);

create table dbtokopaedi.user
(
    user_id         int auto_increment         not null
        primary key,
    user_first_name varchar(25) null,
    user_last_name  varchar(25) null,
    user_address    varchar(50) null,
    user_phone      varchar(14) null,
    user_username   varchar(15) null,
    user_password   varchar(15) null,
    user_email      varchar(50) null,
    location_id     int         null,
    constraint user_location_location_id_fk
        foreign key (location_id) references dbtokopaedi.location (location_id)
);

create table dbtokopaedi.tr_order
(
    tr_order_id        int auto_increment      not null
        primary key,
    date_purchase      datetime null,
    date_shipping      datetime null,
    quantity_item      int      null,
    total              decimal  null,
    user_id            int      null,
    product_detail_id  int      null,
    shipping_method_id int      null,
    payment_method_id  int      null,
    constraint tr_order_payment_method_payment_method_id_fk
        foreign key (payment_method_id) references dbtokopaedi.payment_method (payment_method_id),
    constraint tr_order_product_detail_product_detail_id_fk
        foreign key (product_detail_id) references dbtokopaedi.product_detail (product_detail_id),
    constraint tr_order_shipping_method_shipping_method_id_fk
        foreign key (shipping_method_id) references dbtokopaedi.shipping_method (shipping_method_id),
    constraint tr_order_user_user_id_fk
        foreign key (user_id) references dbtokopaedi.user (user_id)
);