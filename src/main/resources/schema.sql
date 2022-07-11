DROP TABLE IF EXISTS books;
CREATE TABLE books
(
    id       serial PRIMARY KEY,
    isbn     NUMERIC(20, 0) unique NOT NULL,
    title    VARCHAR(250)          NOT NULL,
    author   VARCHAR(250)          NOT NULL,
    summary  VARCHAR(2000)         NOT NULL,
    cover    VARCHAR(250)          NOT NULL,
    currency VARCHAR(250)          NOT NULL,
    price    NUMERIC(19, 2)        NOT NULL
);

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id         serial PRIMARY KEY,
    user_name  VARCHAR(250) unique NOT NULL,
    password   VARCHAR(250)        NOT NULL,
    is_active  BOOLEAN             NOT NULL,
    roles      VARCHAR(250),
    email      VARCHAR(250) unique,
    first_name varchar(250),
    last_name  varchar(250),
    address    varchar(250)
)
