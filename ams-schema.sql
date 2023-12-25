DROP TABLE IF EXISTS ams.payments, ams.employees, ams.departments;
DROP SCHEMA IF EXISTS ams;

CREATE SCHEMA ams;

CREATE TABLE ams.departments
(
    db_id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name  VARCHAR(32) UNIQUE NOT NULL
);

CREATE TABLE ams.employees
(
    db_id      INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    gov_id     VARCHAR(16) UNIQUE NOT NULL,
    full_name  VARCHAR(32)        NOT NULL,
    birth_date DATE               NOT NULL,
    dept_db_id SMALLINT           NULL REFERENCES ams.departments (db_id)
);

CREATE TABLE ams.payments
(
    db_id          BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    employee_db_id INT           NOT NULL REFERENCES ams.employees (db_id),
    quantity       NUMERIC(9, 2) NOT NULL, -- Most currencies in the world have 2 decimal places
    currency_code  CHAR(3)       NOT NULL,
    payment_date   DATE          NOT NULL
)
