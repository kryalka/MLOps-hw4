CREATE MATERIALIZED VIEW IF NOT EXISTS fraud.mv_transactions_base
TO fraud.transactions_base
AS
SELECT *
FROM fraud.transactions_kafka;
