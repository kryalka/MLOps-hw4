{% set marts = [
    'mart_daily_state_metrics', 'mart_fraud_by_category', 'mart_fraud_by_state',
    'mart_customer_risk_profile', 'mart_hourly_fraud_pattern', 'mart_merchant_analytics'
] %}
{% for mart in marts %}
    select '{{ mart }}' as model_name
    from {{ ref(mart) }}
    having
        sum(transaction_count) != (select count() from {{ ref('stg_transactions') }})
        or abs(sum(total_amount) - (
            select sum(stg.amount) from {{ ref('stg_transactions') }} as stg
        )) > 0.01
    {% if not loop.last %}
        union all
    {% endif %}
{% endfor %}
