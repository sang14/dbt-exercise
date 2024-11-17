/** 
Calculates the USD equivalent for transactions and retrieves all relevant transaction details.
**/

with final as (

    select 
    external_ref,
    status,
    source,
    ref,
    date_time,
    transaction_status,
    chargeback,
    cvv_provided,
    native_amount,
    native_currency,
    country,
    {{ calculate_amount_in_usd('native_currency', 'native_amount') }} AS amount_usd
    from {{ ref('transaction_analysis') }}
)

select * from final