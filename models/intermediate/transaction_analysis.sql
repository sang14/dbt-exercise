with final as (
    select 
    acc.external_ref,
    acc.status,
    acc.source,
    ref,
    date_time,
    state as transaction_status,
    chargeback,
    cvv_provided,
    amount as native_amount,
    currency as native_currency,
    country,
    rates
    from {{ ref('acceptance_report') }} acc
    inner join {{ ref('chargeback_report') }} cb
    on acc.external_ref = cb.external_ref
)

select * from final