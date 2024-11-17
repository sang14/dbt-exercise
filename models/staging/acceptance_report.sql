WITH chargeback_report AS (
    SELECT DISTINCT
       *
    FROM {{ ref('Globepay_Acceptance_Report') }}
)

SELECT * FROM chargeback_report
