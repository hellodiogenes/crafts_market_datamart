-- Creating a special layer for data marts
CREATE SCHEMA marts;

-- DDL of the data mart
DROP TABLE IF EXISTS marts.customer_report_datamart;

CREATE TABLE IF NOT EXISTS marts.customer_report_datamart (
    id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL, -- record identifier
    customer_id BIGINT NOT NULL, -- customer ID
    customer_name VARCHAR NOT NULL, -- customer full name
    customer_address VARCHAR NOT NULL, -- customer address
    customer_birthday DATE NOT NULL, -- customer birth date
    customer_email VARCHAR NOT NULL, -- customer email
    customer_expenses NUMERIC(15,2) NOT NULL, -- amount spent by the customer (-10% on platforms)
    platform_money BIGINT NOT NULL, -- amount earned by the platform from customer purchases per month
    count_order BIGINT NOT NULL, -- number of orders placed by the customer in a month
    avg_price_order NUMERIC(10,2) NOT NULL, -- average cost of one order for the customer in a month
    median_time_order_completed NUMERIC(10,1), -- median time in days from order creation to completion within a month
    top_master VARCHAR NOT NULL, -- most popular master for this customer (if the customer has made an equal number of orders with different masters -> take any)
    count_order_created BIGINT NOT NULL, -- number of orders created in a month
    count_order_in_progress BIGINT NOT NULL, -- number of orders in progress during a month
    count_order_delivery BIGINT NOT NULL, -- number of orders in delivery during a month
    count_order_done BIGINT NOT NULL, -- number of completed orders in a month
    count_order_not_done BIGINT NOT NULL, -- number of uncompleted orders in a month
    report_period VARCHAR NOT NULL, -- reporting period year and month
    CONSTRAINT customer_report_datamart_pk PRIMARY KEY (id)
);

-- DDL table for incremental loads
DROP TABLE IF EXISTS marts.load_dates_customer_report_datamart;

CREATE TABLE IF NOT EXISTS marts.load_dates_customer_report_datamart (
    id BIGINT GENERATED ALWAYS AS IDENTITY NOT NULL,
    load_dttm DATE NOT NULL,
    CONSTRAINT load_dates_customer_report_datamart_pk PRIMARY KEY (id)
);