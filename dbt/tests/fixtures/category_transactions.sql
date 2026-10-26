select
    'food' as category,
    100.0 as amount,
    1 as is_fraud
union all
select
    'food' as category,
    300.0 as amount,
    0 as is_fraud
union all
select
    'travel' as category,
    50.0 as amount,
    0 as is_fraud
