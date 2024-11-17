/**
Selects all transactions that did not result in a chargeback.
**/

select 
*
from {{ ref('dim_transactions') }}
where chargeback = false