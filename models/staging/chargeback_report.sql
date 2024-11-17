/**
Loading chargeback data into the staging from seeds.
*/

WITH chargeback_report AS (
    SELECT
       *
    FROM {{ ref('Globepay_Chargeback_Report') }}
)

SELECT * FROM chargeback_report
