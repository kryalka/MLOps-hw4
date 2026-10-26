CREATE DATABASE IF NOT EXISTS transactions_db;

CREATE VIEW IF NOT EXISTS transactions_db.transactions AS
SELECT
    transaction_id,
    transaction_time,
    merch,
    cat_id,
    toFloat64(amount) AS amount,
    name_1,
    name_2,
    gender,
    street,
    post_code,
    us_state,
    lat,
    lon,
    merchant_lat,
    merchant_lon,
    target
FROM fraud.transactions_base;
