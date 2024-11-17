{% macro calculate_amount_in_usd(currency, amount) %}
  CASE 
    WHEN {{ currency }} = 'USD' THEN (cast(JSON_EXTRACT(rates, '$.USD') as decimal) * {{ amount }})
    WHEN {{ currency }} = 'CAD' THEN (cast(JSON_EXTRACT(rates, '$.CAD') as decimal) * {{ amount }})
    WHEN {{ currency }} = 'EUR' THEN (cast(JSON_EXTRACT(rates, '$.EUR') as decimal) * {{ amount }})
    WHEN {{ currency }} = 'MXN' THEN (cast(JSON_EXTRACT(rates, '$.MXN') as decimal) * {{ amount }})
    WHEN {{ currency }} = 'SGD' THEN (cast(JSON_EXTRACT(rates, '$.SGD') as decimal) * {{ amount }})
    WHEN {{ currency }} = 'AUD' THEN (cast(JSON_EXTRACT(rates, '$.AUD') as decimal) * {{ amount }})
    WHEN {{ currency }} = 'GBP' THEN (cast(JSON_EXTRACT(rates, '$.GBP') as decimal) * {{ amount }})
    ELSE 0 -- Default case when no currency match
  END
{% endmacro %}