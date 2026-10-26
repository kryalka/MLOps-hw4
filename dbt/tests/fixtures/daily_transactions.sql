select
    toDate('2024-01-01') as transaction_date,
    'CA' as us_state,
    100.0 as amount,
    'MEDIUM' as amount_bucket
union all
select
    toDate('2024-01-01') as transaction_date,
    'CA' as us_state,
    1000.0 as amount,
    'LARGE' as amount_bucket
union all
select
    toDate('2024-01-02') as transaction_date,
    'NY' as us_state,
    50.0 as amount,
    'SMALL' as amount_bucket
