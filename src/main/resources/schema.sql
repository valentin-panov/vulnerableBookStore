DROP TABLE IF EXISTS books cascade;
CREATE TABLE books
(
    id       bigserial primary key,
    isbn     NUMERIC(20, 0) unique NOT NULL,
    title    VARCHAR(250)          NOT NULL,
    author   VARCHAR(250)          NOT NULL,
    summary  VARCHAR(2000)         NOT NULL,
    cover    VARCHAR(250)          NOT NULL,
    currency VARCHAR(250)          NOT NULL,
    price    NUMERIC(19, 2)        NOT NULL
);

DROP TABLE IF EXISTS users cascade;
CREATE TABLE users
(
    id         bigserial primary key,
    user_name  VARCHAR(255) unique NOT NULL,
    password   VARCHAR(255)        NOT NULL,
    is_active  BOOLEAN             NOT NULL,
    roles      VARCHAR(255),
    email      VARCHAR(255) unique,
    first_name varchar(255),
    last_name  varchar(255),
    address    varchar(255)
);

drop table if exists orders cascade;
create table orders
(
    id          bigserial primary key,
    state       varchar(255) not null,
    order_date  date,
    customer_id bigserial references users (id) on delete cascade
);

drop table if exists order_details cascade;
create table order_details
(
    id         bigserial primary key,
    price      NUMERIC(19, 2) not null,
    quantity   integer        not null,
    order_id   bigserial references orders (id) on DELETE cascade,
    product_id bigserial      references books (id) on delete set null
);

drop table if exists payment_request cascade;
create table payment_request
(
    id          bigserial primary key,
    total       NUMERIC(19, 2) not null,
    card_holder varchar(255)   not null,
    card_number varchar(255)   not null,
    card_cvv    varchar(255)   not null,
    card_expiry varchar(255)   not null,
    order_id    bigserial references orders (id)
)