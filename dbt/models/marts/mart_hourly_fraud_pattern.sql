with hourly_metrics as (
    select
        day_of_week,
        transaction_hour,
        count() as transaction_count,
        countIf(is_fraud = 1) as fraud_count,
        100.0 * countIf(is_fraud = 1) / count() as fraud_rate,
        sum(amount) as total_amount,
        sumIf(amount, is_fraud = 1) as fraud_amount
    from {{ ref('stg_transactions') }}
    group by day_of_week, transaction_hour
)

select
    *,
    fraud_rate > (
        select 100.0 * countIf(stg.is_fraud = 1) / count()
        from {{ ref('stg_transactions') }} as stg
    ) as is_high_risk_window
from hourly_metrics
