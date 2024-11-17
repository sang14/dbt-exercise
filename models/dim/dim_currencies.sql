with final as (
    
    SELECT
    external_ref,
    date_time,
    native_currency,
    JSON_EXTRACT(rates, '$.USD') usd,
    JSON_EXTRACT(rates, '$.CAD') cad,
    JSON_EXTRACT(rates, '$.EUR') eur,
    JSON_EXTRACT(rates, '$.MXN') mxn,
    JSON_EXTRACT(rates, '$.SGD') sgd,
    JSON_EXTRACT(rates, '$.AUD') aud,
    JSON_EXTRACT(rates, '$.GBP') gbp
    from {{ ref('transaction_analysis') }}
    
)

select * from final