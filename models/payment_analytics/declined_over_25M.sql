/**
Retrieves countries with declined transactions where the total USD amount exceeds 25 million.
**/

select 
country,
sum(amount_usd) usd_amount
from {{ ref('dim_transactions') }}
where transaction_status = 'DECLINED'
group by country
having sum(amount_usd) > 25000000