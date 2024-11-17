with accept as 
(select 
EXTRACT(DATE FROM date_time) date_s,
EXTRACT(YEAR FROM date_time)||'-'||EXTRACT(MONTH FROM date_time) mon,
count(external_ref) accepted_transactions
from {{ ref('dim_transactions') }}
where transaction_status = 'ACCEPTED'
group by 1,2
),
overall as (
  select 
  EXTRACT(DATE FROM date_time) date_s,
  EXTRACT(YEAR FROM date_time)||'-'||EXTRACT(MONTH FROM date_time) mon,
  count(external_ref) overall_transactions
  from {{ ref('dim_transactions') }}
  group by 1,2
)

select 
o.date_s,
o.mon,
accepted_transactions,
overall_transactions,
round(((accepted_transactions*100.0)/overall_transactions),2) acceptance_rate
from accept ac
inner join overall o 
on ac.date_s = o.date_s