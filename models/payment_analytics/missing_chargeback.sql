select 
*
from {{ ref('dim_transactions') }}
where chargeback = false