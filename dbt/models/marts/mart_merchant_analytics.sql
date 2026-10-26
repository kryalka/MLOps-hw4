select
    merchant,
    count() as transaction_count,
    uniqExact(customer_id) as unique_customers,
    sum(amount) as total_amount,
    avg(amount) as avg_amount,
    countIf(is_fraud = 1) as fraud_count,
    100.0 * countIf(is_fraud = 1) / count() as fraud_rate,
    fraud_rate >= 5 and transaction_count >= 10 as is_suspicious
from {{ ref('stg_transactions') }}
group by merchant
