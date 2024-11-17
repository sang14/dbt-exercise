WITH chargeback_report AS (
    SELECT DISTINCT
       *
    FROM {{ ref('Globepay_Chargeback_Report') }}
)

SELECT * FROM chargeback_report
